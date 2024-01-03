defmodule DurationFormatter do
  def format_duration(seconds) when seconds < 1, do: "now"

  def format_duration(seconds) when seconds >= 1 do
    %{
      years: years,
      days: days,
      hours: hours,
      minutes: minutes,
      seconds: seconds
    } = breakdown_seconds(seconds)

    list_of_strings =
      [
        make_statement(years, "year"),
        make_statement(days, "day"),
        make_statement(hours, "hour"),
        make_statement(minutes, "minute"),
        make_statement(seconds, "second")
      ]
      |> Enum.filter(fn
        nil -> false
        anything_else -> true
      end)

    case list_of_strings do
      [one_thing] ->
        one_thing

      [many_things | tail] ->
        reverse_list =
          list_of_strings |> duration_builder("") |> String.codepoints() |> Enum.reverse()

        last_comma_index = Enum.find_index(reverse_list, fn character -> character == "," end)
        {_popped_element, reverse_list} = List.pop_at(reverse_list, last_comma_index)
        Enum.reverse(reverse_list) |> List.to_string()
    end
  end

  def duration_builder([h | []], acc) do
    acc <> "and " <> h
  end

  def duration_builder([h | t], acc) do
    duration_builder(t, acc <> h <> ", ")
  end

  def duration_builder([], acc) do
    acc
  end

  def make_statement(0, _unit), do: nil
  def make_statement(count, unit) when count == 1, do: "1 #{unit}"
  def make_statement(count, unit) when count > 1, do: "#{count} #{unit}s"

  def breakdown_seconds(seconds) do
    Enum.reduce(
      [{:years, ""}, {:days, ""}, {:hours, ""}, {:minutes, ""}, {:seconds, ""}],
      %{total_seconds: seconds, remaining_seconds: seconds},
      fn
        {:years, value}, acc ->
          years = div(acc.remaining_seconds, 31_536_000)
          seconds_to_remove = years * 31_536_000

          Map.update(acc, :remaining_seconds, nil, fn remaining_seconds ->
            remaining_seconds - seconds_to_remove
          end)
          |> Map.put(:years, years)

        {:days, value}, acc ->
          days = div(acc.remaining_seconds, 86400)
          seconds_to_remove = days * 86400

          Map.update(acc, :remaining_seconds, nil, fn remaining_seconds ->
            remaining_seconds - seconds_to_remove
          end)
          |> Map.put(:days, days)

        {:hours, value}, acc ->
          hours = div(acc.remaining_seconds, 3600)
          seconds_to_remove = hours * 3600

          Map.update(acc, :remaining_seconds, nil, fn remaining_seconds ->
            remaining_seconds - seconds_to_remove
          end)
          |> Map.put(:hours, hours)

        {:minutes, value}, acc ->
          minutes = div(acc.remaining_seconds, 60)
          seconds_to_remove = minutes * 60

          Map.update(acc, :remaining_seconds, nil, fn remaining_seconds ->
            remaining_seconds - seconds_to_remove
          end)
          |> Map.put(:minutes, minutes)

        {:seconds, value}, acc ->
          seconds = div(acc.remaining_seconds, 1)
          seconds_to_remove = seconds * 1

          Map.update(acc, :remaining_seconds, nil, fn remaining_seconds ->
            remaining_seconds - seconds_to_remove
          end)
          |> Map.put(:seconds, seconds)
      end
    )
  end
end

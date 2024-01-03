defmodule Kata do
  def past(h, m, s) do
    seconds_in_milliseconds = s * 1000
    minutes_in_milliseconds = m * 60 * 1000
    hours_in_milliseconds = h * 60 * 60 * 1000

    [seconds_in_milliseconds, minutes_in_milliseconds, hours_in_milliseconds]
    |> Enum.sum()
  end
end

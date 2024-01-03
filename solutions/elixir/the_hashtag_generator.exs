defmodule Hashtag do
  def generate(input) do
    # code here
    if String.trim(input) == "" do
      false
    else
      process_tweet(input)
    end
  end

  defp process_tweet(input) do
    String.split(input)
    |> Enum.map(&String.capitalize/1)
    |> List.to_string()
    |> check_length()
    |> (fn
          false ->
            false

          input ->
            String.graphemes(input)
            |> List.insert_at(0, "#")
            |> List.to_string()
        end).()
  end

  defp check_length(input) do
    if String.length(input) >= 140, do: false, else: input
  end
end

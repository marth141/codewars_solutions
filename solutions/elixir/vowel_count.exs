defmodule VowelCount do
  def get_count(str) do
    String.graphemes(str)
    |> Enum.reduce(0, fn letter, acc ->
      if letter in ["a", "e", "i", "o", "u"], do: acc + 1, else: acc
    end)
  end
end

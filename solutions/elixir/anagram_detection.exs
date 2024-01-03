defmodule Anagram do
  def anagram?(a, b) do
    sort(a) == sort(b)
  end

  def sort(string) do
    String.downcase(string)
    |> String.graphemes()
    |> Enum.sort()
  end
end

defmodule EndsWith do
  def solution(_str, ""), do: true

  def solution(str, ending) do
    length_of_ending = String.length(ending)
    str_ending = String.graphemes(str) |> Enum.take(-length_of_ending) |> List.to_string()
    str_ending == ending
  end
end

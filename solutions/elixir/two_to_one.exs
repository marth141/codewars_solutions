defmodule TwoToOne do
  def longest(a, b) do
    (a <> b) |> String.graphemes() |> MapSet.new() |> MapSet.to_list() |> List.to_string()
  end
end

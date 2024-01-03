defmodule DuplicateCount do
  def count(str) do
    String.downcase(str)
    |> String.graphemes()
    |> Enum.frequencies()
    |> Enum.reject(fn {_k, v} -> v <= 1 end)
    |> Enum.count()
  end
end

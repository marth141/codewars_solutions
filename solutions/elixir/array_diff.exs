defmodule ArrayDiff do
  def array_diff(a, b) do
    Enum.filter(a, fn a -> !Enum.member?(b, a) end)
  end
end

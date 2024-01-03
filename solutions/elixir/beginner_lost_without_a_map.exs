defmodule Maps do
  def maps(x), do: Enum.map(x, &(&1 * 2))
end

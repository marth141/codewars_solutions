defmodule Bus do
  def number([]) do
    0
  end

  def number(stops) do
    Enum.reduce(stops, 0, fn {on, off}, acc -> on - off + acc end)
  end
end

defmodule Inverter do
  def invert(list) do
    Enum.map(list, fn
      0 -> 0
      n when n > 0 -> -n
      n when n < 0 -> -n
    end)
  end
end

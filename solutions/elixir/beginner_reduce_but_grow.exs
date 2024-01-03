defmodule Grow do
  def grow(arr) do
    Enum.reduce(arr, 1, fn n, acc -> n * acc end)
  end
end

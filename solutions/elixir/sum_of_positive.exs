defmodule Solution do
  def positive_sum(arr) do
    Enum.reject(arr, fn x -> x < 0 end) |> Enum.sum()
  end
end

defmodule SquareSum do
  def square_sum(nums) do
    Enum.map(nums, & &1 * &1)
    |> Enum.sum()
  end
end

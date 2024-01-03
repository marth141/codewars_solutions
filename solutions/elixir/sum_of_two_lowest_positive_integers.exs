defmodule SmallSummer do
  def sum_two_smallest_numbers(numbers) do
    numbers = Enum.sort(numbers, &(&1 >= &2))
    last = Enum.at(numbers, -1)
    penultimate = Enum.at(numbers, -2)

    last + penultimate
  end
end

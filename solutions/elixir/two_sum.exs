defmodule TwoSum do
  # input: ([1, 2, 3], 4)
  # Sort the list to get lowest number first
  # Starting from head (lowest number), add the next numbers in tail to see if they make the target 4
  # If none match target, pop head and redo with next head as start, repeat until target found
  # output indexes that make 4: {0, 2}
  @spec two_sum([integer()], integer()) :: {integer(), integer()}
  def two_sum(numbers, target) do
    Enum.sort(numbers)
    |> process_list(numbers, target)
  end

  def process_list([h | t] = numbers, original_numbers, target) do
    with {a, b, true} = result <-
           Enum.map(t, fn t_n -> {h, t_n, t_n + h == target} end)
           |> Enum.find(fn
             {_, _, true} -> true
             {_, _, false} -> false
           end) do
      a_index = Enum.find_index(original_numbers, &(&1 == a))
      b_index = Enum.find_index(original_numbers, &(&1 == b))
      terminate({a, b}, {a_index, b_index})
    else
      _ -> process_list(t, original_numbers, target)
    end
  end

  def terminate({a, b}, {a_index, b_index}) when a == b, do: {a_index, b_index + 1}
  def terminate({a, b}, {a_index, b_index}) when a != b, do: {a_index, b_index}
end

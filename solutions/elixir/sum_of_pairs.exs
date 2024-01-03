defmodule SumOfPairs do
  @doc """

  Finds the first pair of ints as judged by the index of the second value.

  iex> sum_pairs( [ 10, 5, 2, 3, 7, 5 ], 10 )

  { 3, 7 }

  """

  def sum_pairs(ints, sum) do
    for current <- ints, reduce: %{} do
      seen ->
        candidate = sum - current

        if Map.has_key?(seen, candidate) do
          throw({candidate, current})
        else
          Map.put(seen, current, nil)
        end
    end

    nil
  catch
    result -> result
  end
end

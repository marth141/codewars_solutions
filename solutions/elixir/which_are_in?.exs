defmodule Whicharein do
  def in_array(array_1, array_2) do
    Enum.filter(array_1, fn word_1 ->
      Enum.find_value(array_2, fn word_2 ->
        String.match?(word_2, ~r/#{word_1}/)
      end)
    end)
    |> Enum.sort()
  end
end

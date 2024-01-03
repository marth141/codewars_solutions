defmodule Challenge do
  def get_middle(str) do
    graphemes = String.graphemes(str)
    length_of_string = Enum.reduce(graphemes, 0, fn _letter, acc -> acc + 1 end)

    case rem(length_of_string, 2) do
      0 ->
        middle_1 = div(length_of_string, 2) - 1
        middle_2 = middle_1 + 1
        String.at(str, middle_1) <> String.at(str, middle_2)

      _ ->
        middle = div(length_of_string, 2)
        String.at(str, middle)
    end
  end
end

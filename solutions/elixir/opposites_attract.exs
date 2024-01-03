defmodule Opposites do
  require Integer

  def inlove?(flower1, flower2) do
    flowers = [Integer.is_even(flower1), Integer.is_even(flower2)]
    any_true? = Enum.any?(flowers, fn x -> x == true end)
    any_false? = Enum.any?(flowers, fn x -> x == false end)
    {true, true} == {any_true?, any_false?}
  end
end

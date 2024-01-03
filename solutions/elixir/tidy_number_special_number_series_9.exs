defmodule TidyNumber do
  def tidy_numbers([h1 | []]), do: true
  def tidy_numbers([h1 | [h2 | _] = t]) when h1 <= h2, do: tidy_numbers(t)
  def tidy_numbers([h1 | [h2 | _] = t]) when h1 > h2, do: false
  def tidy_number(n), do: Integer.digits(n) |> tidy_numbers()
end

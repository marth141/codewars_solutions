defmodule Kata do
  def descending_order(n) do
    {integer, _} =
      Integer.digits(n)
      |> Enum.sort(:desc)
      |> Enum.join("")
      |> Integer.parse()

    integer
  end
end

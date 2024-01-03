defmodule CountBits do
  def bits(n) do
    Integer.digits(n, 2)
    |> Enum.filter(fn number -> number != 0 end)
    |> length()
  end
end

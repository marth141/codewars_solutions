defmodule Kata do
  def high_and_low(s) do
    s =
      String.split(s)
      |> Enum.map(fn s ->
        {int, _} = Integer.parse(s)
        int
      end)
      |> Enum.sort(&(&1 >= &2))

    "#{List.first(s)} #{List.last(s)}"
  end
end

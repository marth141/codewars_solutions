defmodule Digitizer do
  def digitize(n) do
    n
    |> to_string()
    |> String.graphemes()
    |> Enum.reverse()
    |> Enum.map(fn n ->
      {n, _} = Integer.parse(n)
      n
    end)
    |> IO.inspect
  end
end

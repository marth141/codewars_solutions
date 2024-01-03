defmodule Countdigit do
  def nb_dig(n, d) do
    Enum.map(0..n, &to_string(&1 * &1))
    |> Enum.filter(&String.contains?(&1, to_string(d)))
    |> List.to_string()
    |> String.graphemes()
    |> Enum.reject(&(&1 != to_string(d)))
    |> Enum.count()
  end
end

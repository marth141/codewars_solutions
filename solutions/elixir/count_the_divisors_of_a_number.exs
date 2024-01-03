defmodule Kata do
  def divisors(1), do: 1
  def divisors(n), do: [1 | divisors(2, n, :math.sqrt(n))] |> List.insert_at(0, n) |> Enum.count()
  def divisors(k, _n, q) when k > q, do: []
  def divisors(k, n, q) when rem(n, k) > 0, do: divisors(k + 1, n, q)
  def divisors(k, n, q) when k * k == n, do: [k | divisors(k + 1, n, q)]
  def divisors(k, n, q), do: [k, div(n, k) | divisors(k + 1, n, q)]
end

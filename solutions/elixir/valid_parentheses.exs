defmodule ParenthesesValidator do
  def valid_parentheses(string) do
    String.graphemes(string) |> reject_alphanumeric() |> valid_parentheses_loop(0)
  end

  def reject_alphanumeric(list),
    do: Enum.reject(list, fn el -> Regex.match?(~r/[a-z]|[A-Z]|[0-9]/, el) end)

  def valid_parentheses_loop(_, n) when n < 0, do: false
  def valid_parentheses_loop([], 0), do: true
  def valid_parentheses_loop([], _n), do: false
  def valid_parentheses_loop(["(" | t], n), do: valid_parentheses_loop(t, n + 1)
  def valid_parentheses_loop([")" | t], n), do: valid_parentheses_loop(t, n - 1)
end

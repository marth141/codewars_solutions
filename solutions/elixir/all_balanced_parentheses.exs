defmodule Kata do
  def balanced_parens(n) do
    parens("", n, n, [])
  end

  # If we get 1 for our n, we do this
  defp parens(str, 1, 1, list), do: [str <> "()" | list]
  # If we have 0 for left parentheses, insert right parentheses
  defp parens(str, 0, n, list), do: [str <> String.duplicate(")", n) | list]
  # If the left and right parentheses are the same, insert another left parenetheses
  defp parens(str, n, n, list), do: parens(str <> "(", n - 1, n, list)
  # Insert left parentheses and right parentheses
  defp parens(str, m, n, list) do
    parens(str <> "(", m - 1, n, parens(str <> ")", m, n - 1, list))
  end
end

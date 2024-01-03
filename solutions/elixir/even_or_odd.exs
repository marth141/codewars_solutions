defmodule Codewars do
  require Integer
  def even_or_odd(number) do
    if Integer.is_even(number), do: "Even", else: "Odd"
  end
end

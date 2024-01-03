defmodule Printererror do
  def printer_error(s) do
    in_error =
      String.graphemes(s)
      |> Enum.reduce(0, fn s, acc ->
        if s in ["n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"] do
          acc + 1
        else
          acc
        end
      end)

    total = String.length(s)

    "#{in_error}/#{total}"
  end
end

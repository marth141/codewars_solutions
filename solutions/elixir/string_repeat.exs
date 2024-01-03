defmodule Solution do
  def repeat_str(n, s), do: Enum.map(1..n, fn _ -> s end) |> List.to_string()
end

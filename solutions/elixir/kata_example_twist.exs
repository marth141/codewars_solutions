defmodule Websites do
  def websites, do: Enum.map(1..1000, fn _ -> "codewars" end)
end

defmodule Evenator do
  def even?(0), do: true
  def even?(n) when is_float(n), do: false
  def even?(n) do
    case rem(n, 2) do
      0 -> true
      _anything_else -> false
    end
  end
end

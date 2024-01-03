defmodule Kata do
  def digital_root(n) do
    reduction =
      n
      |> Integer.digits()
      |> Enum.sum()

    reduction_length = reduction |> Integer.digits() |> Enum.count()

    if reduction_length == 1 do
      reduction
    else
      digital_root(reduction)
    end
  end
end

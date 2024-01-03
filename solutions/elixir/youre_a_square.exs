defmodule Math do
  def square?(n) when n >= 0 do
    with {_, 1} <- :math.sqrt(n)
    |> Float.ratio do
      true
    else
      {_, _} -> false
    end
  end

  def square?(n) do
    false
  end
end

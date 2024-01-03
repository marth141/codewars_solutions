defmodule Directions do
  def reduce(directions) do
    my_reduce(directions)
    |> my_reduce()
    |> IO.inspect()
  end

  def my_reduce([a | [b | t] = other_t] = directions) do
    case {a, b} do
      {"NORTH", "SOUTH"} -> my_reduce(t)
      {"SOUTH", "NORTH"} -> my_reduce(t)
      {"EAST", "WEST"} -> my_reduce(t)
      {"WEST", "EAST"} -> my_reduce(t)
      _ -> [a | my_reduce(other_t)]
    end
  end

  def my_reduce([h1 | t]) do
    [h1 | my_reduce(t)]
  end

  def my_reduce([]) do
    []
  end
end

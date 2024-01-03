defmodule Aretheythesame do
  @spec comp([number], [number]) :: boolean
  def comp([], []) do
    true
  end

  def comp([], _) do
    false
  end

  def comp(_, []) do
    false
  end

  def comp(a, b) do
    a =
      Enum.map(a, fn
        a_el ->
          {f, _} = to_string(a_el) |> Float.parse()
          f
      end)
      |> Enum.sort()

    b =
      Enum.map(b, fn b_el -> :math.sqrt(b_el) end)
      |> Enum.sort()

    diff = a -- b
    comp(diff)
  end

  def comp([]) do
    true
  end

  def comp(_) do
    false
  end
end

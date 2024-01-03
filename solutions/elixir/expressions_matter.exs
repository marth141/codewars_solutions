defmodule ExpressionMatter do
  def expression_matter(a, b, c) do
    no_parenthesis =
      Enum.map(1..operators_total(), fn _ ->
        "#{a} #{random_operators()} #{b} #{random_operators()} #{c}"
      end)
      |> MapSet.new()
      |> MapSet.to_list()

    left_parenthesis =
      Enum.map(1..operators_total(), fn _ ->
        "(#{a} #{random_operators()} #{b}) #{random_operators()} #{c}"
      end)
      |> MapSet.new()
      |> MapSet.to_list()

    right_parenthesis =
      Enum.map(1..operators_total(), fn _ ->
        "#{a} #{random_operators()} (#{b} #{random_operators()} #{c})"
      end)
      |> MapSet.new()
      |> MapSet.to_list()

    [no_parenthesis, left_parenthesis, right_parenthesis]
    |> List.flatten()
    |> Enum.map(fn
      s ->
        {result, _} = Code.eval_string(s)
        result
    end)
    |> Enum.max()
  end

  def operators_total(), do: Enum.count(operators()) * Enum.count(operators()) * 10
  def random_operators(), do: Enum.random(operators())
  def operators(), do: ["+", "*"]
end

defmodule Kata do
  def disemvowel(s) do
    s
    |> String.codepoints()
    |> Enum.map(fn letter ->
      case String.downcase(letter) do
        "a" ->
          ""

        "e" ->
          ""

        "i" ->
          ""

        "o" ->
          ""

        "u" ->
          ""

        _ ->
          letter
      end
    end)
    |> List.to_string()
  end
end

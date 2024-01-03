defmodule Encryptor do
  def rot13(<<char>> <> tail) do
    <<rotate(char)>> <> rot13(tail)
  end

  def rot13(_), do: ""

  defp rotate(char) when char in ?a..?z do
    rem(char - ?a + 13, 26) + ?a
  end

  defp rotate(char) when char in ?A..?Z do
    rem(char - ?A + 13, 26) + ?A
  end

  defp rotate(char), do: char
end

defmodule SentenceSmasher do
  def smash(words) do
    reduce(words)
  end

  def reduce([word | []]), do: word
  def reduce(words) do
    Enum.reduce(words, "", fn word, acc -> acc <> word <> " " end)
    |> String.trim_trailing()
  end
end

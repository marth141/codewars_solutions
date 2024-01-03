defmodule Convertor do
  def dna_to_rna(dna) do
    String.graphemes(dna)
    |> Enum.map(fn
      "G" -> "G"
      "C" -> "C"
      "A" -> "A"
      "T" -> "U"
    end)
    |> Enum.join("")
  end
end

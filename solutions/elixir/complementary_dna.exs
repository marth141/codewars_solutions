defmodule Dna do
  @key %{
    "A" => "T",
    "T" => "A",
    "C" => "G",
    "G" => "C"
  }
  def dna_strand(dna_str) do
    String.graphemes(dna_str)
    |> Enum.map(&Map.get(@key, &1))
    |> List.to_string()
  end
end

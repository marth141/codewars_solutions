defmodule TalantDetector do
  def are_you_playing_banjo?(name) do
    if String.at(name, 0) |> String.match?(~r/r/i),
      do: "#{name} plays banjo",
      else: "#{name} does not play banjo"
  end
end

defmodule RockPaperScissors do
  @key %{
    "paper" => "rock",
    "rock" => "scissors",
    "scissors" => "paper"
  }
  def rps(p1, p2) do
    cond do
      Map.get(@key, p1) == p2 -> "Player 1 won!"
      Map.get(@key, p2) == p1 -> "Player 2 won!"
      p1 == p2 -> "Draw!"
    end
  end
end

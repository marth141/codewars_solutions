defmodule SplitStrings do
  require Integer

  def solution(str) do
    codepoints = str |> String.codepoints()
    codepoints_length = codepoints |> length

    is_odd? = codepoints_length |> Integer.is_odd()

    if is_odd? do
      codepoints
      |> List.insert_at(codepoints_length, "_")
      |> Enum.chunk_every(2)
      |> Enum.map(fn pair -> List.to_string(pair) end)
    else
      codepoints |> Enum.chunk_every(2) |> Enum.map(fn pair -> List.to_string(pair) end)
    end
  end
end

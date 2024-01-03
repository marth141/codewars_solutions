defmodule Kata do
  def find_outlier(integers) do
    require Integer

    numbers_assessment =
      integers
      |> Enum.map(fn number -> %{"number" => number, "is_even" => Integer.is_even(number)} end)

    frequencies =
      numbers_assessment
      |> Enum.frequencies_by(fn %{"is_even" => even} -> even end)

    if frequencies.true == 1 do
      [result] =
        numbers_assessment
        |> Enum.filter(fn %{"is_even" => even} -> even == true end)

      result["number"]
    else
      [result] =
        numbers_assessment
        |> Enum.filter(fn %{"is_even" => even} -> even == false end)

      result["number"]
    end
  end
end

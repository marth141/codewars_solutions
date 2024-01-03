defmodule Tortoise do
  def race(v1, v2, g) do
    hours = g / (v2 - v1) + 0.000001
    hours_floor = Float.floor(hours)
    minutes = (hours - hours_floor) * 60
    minutes_floor = Float.floor(minutes)
    seconds = (minutes - minutes_floor) * 60
    seconds_floor = Float.floor(seconds)
    results([hours_floor, minutes_floor, seconds_floor]) |> IO.inspect(label: "AUDIT 3")
  end
  def results([h, m, s]) when h < 0 or m < 0 or s < 0, do: nil
  def results([h, m, s]) do
    IO.inspect([h, m, s], label: "AUDIT")
    {h_int, _} = Integer.parse(Float.to_string(h))
    {m_int, _} = Integer.parse(Float.to_string(m))
    {s_int, _} = Integer.parse(Float.to_string(s))
    IO.inspect([h_int, m_int, s_int], label: "AUDIT 2")
  end
end

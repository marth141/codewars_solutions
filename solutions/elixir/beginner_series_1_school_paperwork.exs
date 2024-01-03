defmodule Paperwork do
  def paperwork(n, m) when n > 0 and m > 0 do
    n * m
  end

  def paperwork(n, m) when n <= 0 or m <= 0 do
    0
  end
end

defmodule Finder do
  def find_needle(haystack) do
    index = Enum.find_index(haystack, fn el -> el == "needle" end)
    "found the needle at position #{index}"
  end
end

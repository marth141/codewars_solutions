defmodule Messy do
  # Input: "tom jerry"
  # String.split(" ") to separate the words like ["tom", "jerry"]
  # List.first() to get the first name
  # List.last() to get the last name
  # concat last_name <> first name
  # output: "Jerry tom"
  def name_shuffler(str) do
    list = String.split(str, " ")
    first_name = List.first(list)
    last_name = List.last(list)
    last_name <> " " <> first_name
  end
end

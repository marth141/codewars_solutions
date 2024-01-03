defmodule Hellouer do
  def say_hello([first_name, last_name], city, state) do
    "Hello, #{first_name} #{last_name}! Welcome to #{city}, #{state}!"
  end

  def say_hello([first_name, middle_name, last_name], city, state) do
    "Hello, #{first_name} #{middle_name} #{last_name}! Welcome to #{city}, #{state}!"
  end
end

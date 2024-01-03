defmodule Detector do
  def better_than_average(class_points, your_points) do
    sum_of_class_points = Enum.sum(class_points)
    count_of_class_points = Enum.reduce(class_points, 0, fn score, acc -> acc + 1 end)
    average_class_points = div(sum_of_class_points, count_of_class_points)
    your_points > average_class_points
  end
end

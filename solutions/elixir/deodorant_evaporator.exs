defmodule Evaporator do
  @spec evaporator(number, number, number) :: number

  def evaporator(content, evap_per_day, threshold) do
    days = 1

    lost_content = get_lost_content(content, evap_per_day)

    percentage_loss = get_percentage_lost(lost_content, content)

    evaporator(%{
      "lost_content" => lost_content,
      "original_content" => content,
      "evap_per_day" => evap_per_day,
      "threshold" => threshold,
      "percentage_loss" => percentage_loss,
      "days" => days
    })
  end

  def evaporator(%{
        "lost_content" => lost_content,
        "original_content" => original_content,
        "evap_per_day" => evap_per_day,
        "threshold" => threshold,
        "percentage_loss" => percentage_loss,
        "days" => days
      })
      when percentage_loss > threshold do
    days = days + 1

    lost_content = get_lost_content(lost_content, evap_per_day)

    percentage_loss = get_percentage_lost(lost_content, original_content)

    evaporator(%{
      "lost_content" => lost_content,
      "original_content" => original_content,
      "evap_per_day" => evap_per_day,
      "threshold" => threshold,
      "percentage_loss" => percentage_loss,
      "days" => days
    })
  end

  def evaporator(%{
        "lost_content" => lost_content,
        "original_content" => original_content,
        "evap_per_day" => evap_per_day,
        "threshold" => threshold,
        "percentage_loss" => percentage_loss,
        "days" => days
      })
      when percentage_loss < threshold do
    days
  end

  defp get_percentage_lost(lost_content, content) do
    lost_content / content * 100
  end

  defp get_lost_content(content, evap_per_day) do
    content - content * (evap_per_day / 100)
  end
end

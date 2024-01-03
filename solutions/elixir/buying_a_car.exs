defmodule Buycar do
  def nb_months(startPriceOld, startPriceNew, savingperMonth, percentLossByMonth) do
    two_month_growth = 0.005
    {:ok, old_car} = Agent.start_link(fn -> startPriceOld end)
    {:ok, new_car} = Agent.start_link(fn -> startPriceNew end)
    {:ok, savings} = Agent.start_link(fn -> 0 end)
    {:ok, percent_loss_by_month} = Agent.start_link(fn -> percentLossByMonth / 100 end)

    {:ok, car_trade} =
      Agent.start_link(fn ->
        old_car_price = Agent.get(old_car, fn price -> price end)
        new_car_price = Agent.get(new_car, fn price -> price end)
        savings = Agent.get(savings, fn savings -> savings end)
        old_car_price + new_car_price + savings
      end)

    months = 0..100_000

    month_done =
      Enum.find(months, fn month ->
        if month == 0 do
          Agent.update(car_trade, fn trade_value ->
            old_car_price = Agent.get(old_car, fn price -> price end)
            new_car_price = Agent.get(new_car, fn price -> price end)
            savings = Agent.get(savings, fn savings -> savings end)
            old_car_price + savings - new_car_price
          end)

          check_car_trade(car_trade)
        else
          if rem(month, 2) == 0 do
            Agent.update(percent_loss_by_month, fn loss -> loss + 0.005 end)
            this_months_percent_loss = Agent.get(percent_loss_by_month, fn loss -> loss end)
            Agent.update(old_car, fn worth -> worth - worth * this_months_percent_loss end)
            Agent.update(new_car, fn worth -> worth - worth * this_months_percent_loss end)
            Agent.update(savings, fn saved -> saved + savingperMonth end)

            Agent.update(car_trade, fn trade_value ->
              old_car_price = Agent.get(old_car, fn price -> price end)
              new_car_price = Agent.get(new_car, fn price -> price end)
              savings = Agent.get(savings, fn savings -> savings end)
              old_car_price + savings - new_car_price
            end)

            check_car_trade(car_trade)
          else
            this_months_percent_loss = Agent.get(percent_loss_by_month, fn loss -> loss end)
            Agent.update(old_car, fn worth -> worth - worth * this_months_percent_loss end)
            Agent.update(new_car, fn worth -> worth - worth * this_months_percent_loss end)
            Agent.update(savings, fn saved -> saved + savingperMonth end)

            Agent.update(car_trade, fn trade_value ->
              old_car_price = Agent.get(old_car, fn price -> price end)
              new_car_price = Agent.get(new_car, fn price -> price end)
              savings = Agent.get(savings, fn savings -> savings end)
              old_car_price + savings - new_car_price
            end)

            check_car_trade(car_trade)
          end
        end
      end)

    car_trade = Agent.get(car_trade, fn value -> value end)

    if is_integer(car_trade) do
      {month_done, car_trade}
    else
      {left_over, _} =
        Float.round(car_trade)
        |> Float.to_string()
        |> Integer.parse()

      {month_done, left_over}
    end
  end

  defp check_car_trade(car_trade_agent) do
    trade_value = Agent.get(car_trade_agent, fn trade_value -> trade_value end)

    if trade_value > 0 do
      true
    else
      false
    end
  end
end

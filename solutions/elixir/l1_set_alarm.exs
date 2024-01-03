defmodule Alarm do
  def set_alarm(true, false), do: true
  def set_alarm(_employed, _vacation), do: false
end

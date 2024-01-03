defmodule Solution do
  def is_valid_ip(ip) do
    frequencies = String.graphemes(ip) |> Enum.frequencies()

    if frequencies["."] == 3 do
      charlist = ip |> to_charlist()

      with {:ok, _} <- :inet.parse_address(charlist) do
        true
      else
        {:error, _} -> false
      end
    else
      false
    end
  end
end

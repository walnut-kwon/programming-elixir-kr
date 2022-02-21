defmodule Catch do
  def start(n) do
    try do
      incite(n)
    catch
      :exit, code   -> "Exited with code #{inspect code}"
      :throw, value -> "throw called with #{inspect value}"
      what, value   -> "Caught #{inspect what} with #{inspect value}"
    end
  end

  defp incite(1) do
    exit(:something_bad_happened)
  end

  defp incite(2) do
    throw {:animal, "wombat"}
  end

  defp incite(3) do
    :erlang.error "Oh no!"
  end
end

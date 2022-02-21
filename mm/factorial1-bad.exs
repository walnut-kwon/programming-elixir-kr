defmodule BadFactorial do
  def of(n), do: n * of(n-1)
  def of(0), do: 1
end

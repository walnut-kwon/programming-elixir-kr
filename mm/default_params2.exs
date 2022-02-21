defmodule Params do

  def func(p1, p2 \\ 123)

  def func(p1, p2) when is_list(p1)  do
    "You said #{p2} with a list"
  end

  def func(p1, p2) do
    "You passed in #{p1} and #{p2}"
  end

end

IO.puts Params.func(99)           # You passed in 99 and 123
IO.puts Params.func(99, "cat")    # You passed in 99 and cat
IO.puts Params.func([99])         # You said 123 with a list
IO.puts Params.func([99], "dog")  # You said dog with a list

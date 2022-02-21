defmodule MyApp.MyTask do
  use Task

  def start_link(param) do
    Task.start_link(__MODULE__, :thing_to_run, [ param ])
  end

  def thing_to_run(param) do
    IO.puts "running task with #{param}"
  end
end

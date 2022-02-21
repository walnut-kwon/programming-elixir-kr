defmodule Frequency do
  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end


  def add_word(word) do
    Agent.update(__MODULE__,
                 fn map ->
                      Map.update(map, word, 1, &(&1+1))
                 end)
  end

  def count_for(word) do
    Agent.get(__MODULE__, fn map -> map[word] end)
  end

  def words do
    Agent.get(__MODULE__, fn map -> Map.keys(map) end)
  end
end

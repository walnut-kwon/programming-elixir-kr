defmodule Sequence.Server do
  use GenServer

  @vsn "0"

  #####
  # 외부 API

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def next_number do
    with number = GenServer.call __MODULE__, :next_number do
      "다음 번호는 #{number}번입니다."
    end
  end

  def increment_number(delta) do
    GenServer.cast __MODULE__, {:increment_number, delta}
  end

  #####
  # 젠서버 구현

  def init(_) do
    { :ok, Sequence.Stash.get() }
  end

  def handle_call(:next_number, _from, current_number) do
    { :reply, current_number, current_number+1 }
  end

  def handle_cast({:increment_number, delta}, current_number) do
    { :noreply, current_number + delta}
  end

  def terminate(_reason, current_number) do
    Sequence.Stash.update(current_number)
  end

end

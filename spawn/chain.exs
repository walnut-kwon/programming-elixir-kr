defmodule Chain do
  def counter(next_pid) do
    receive do
      n ->
        send next_pid, n + 1
    end
  end

  def create_processes(n) do
    code_to_run = fn (_,send_to) ->
      spawn(Chain, :counter, [send_to])
    end

    last = Enum.reduce(1..n, self(), code_to_run)

    send(last, 0)    # 마지막 프로세스에 0을 보내 카운트를 시작한다.

    receive do       # 그리고 결과가 돌아올 때까지 기다린다.
      final_answer when is_integer(final_answer) ->
        "Result is #{inspect(final_answer)}"
    end
  end

  def run(n) do
    :timer.tc(Chain, :create_processes, [n])
    |> IO.inspect
  end
end

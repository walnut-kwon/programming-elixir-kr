defmodule Countdown do

  def sleep(seconds) do
    receive do
      after seconds*1000 -> nil
    end
  end

  def say(text) do
    spawn fn -> :os.cmd('say #{text}') end
  end

  def timer do
    Stream.resource(
      fn ->          # 분 단위가 바뀔 때까지 남은 초를 계산한다
         {_h,_m,s} = :erlang.time
         60 - s - 1
      end,

      fn             # 1초 뒤 카운트다운 값을 반환한다
        0 ->
          {:halt, 0}

        count ->
          sleep(1)
          { [inspect(count)], count - 1 }
      end,

      fn _ -> nil end   # 할당 해제할 자원 없음
    )
  end
end

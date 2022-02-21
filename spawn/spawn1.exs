defmodule Spawn1 do
  def greet do
    receive do
      {sender, msg} ->
        send sender, { :ok, "Hello, #{msg}" }
    end
  end
end

# 클라이언트
pid = spawn(Spawn1, :greet, [])
send pid, {self(), "World!"}

receive do
  {:ok, message} ->
    IO.puts message
end

defmodule Duper.Results do

  use GenServer

  @me __MODULE__


  # API

  def start_link(_) do
    GenServer.start_link(__MODULE__, :no_args, name: @me)
  end

  def add_hash_for(path, hash) do
    GenServer.cast(@me, { :add, path, hash })
  end

  def find_duplicates() do
    GenServer.call(@me, :find_duplicates)
  end

  # 서버

  def init(:no_args) do
    { :ok, %{} }
  end

  def handle_cast({ :add, path, hash }, results) do
    results =
      Map.update(
        results,          # 이 맵 안에서
        hash,             # 이 키에 해당하는 항목을 찾는다
        [ path ],         # 항목이 없으면 이 값을 저장하고
        fn existing ->    # 항목이 있으면 이 함수의 결과로 항목을 갱신한다
          [ path | existing ]
        end)
    { :noreply, results }
  end

  def handle_call(:find_duplicates, _from, results) do
    {
      :reply,
      hashes_with_more_than_one_path(results),
      results
    }
  end

  defp hashes_with_more_than_one_path(results) do
    results
    |> Enum.filter(fn { _hash, paths } -> length(paths) > 1 end)
    |> Enum.map(&elem(&1, 1))
  end

end

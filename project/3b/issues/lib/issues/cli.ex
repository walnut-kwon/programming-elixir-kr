defmodule Issues.CLI do
  @default_count 4
  @moduledoc """
  커맨드 라인 파싱을 수행한 뒤, 각종 함수를 호출해
  깃허브 프로젝트의 최근 _n_개 이슈를 표 형식으로 만들어 출력한다.
  """
  def run(argv) do
    argv
    |> parse_args
    |> process
  end

  @doc """
  `argv`는 -h 또는 --help (이 경우 :help를 반환)이거나,
  깃허브 사용자 이름, 프로젝트 이름, (선택적으로) 가져올 이슈 개수여야 한다.

  `{사용자명, 프로젝트명, 이슈 개수}` 또는 :help를 반환한다.
  """
  def parse_args(argv) do
    OptionParser.parse(argv, switches: [ help: :boolean],
                             aliases: [ h: :help ])
    |> elem(1)
    |> args_to_internal_representation()
  end


  def args_to_internal_representation([user, project, count]) do
    { user, project, String.to_integer(count) }
  end

  def args_to_internal_representation([user, project]) do
    { user, project, @default_count }
  end

  def args_to_internal_representation(_) do # 잘못된 인자 또는 --help
    :help
  end

  def process(:help) do
    IO.puts """
    usage: issues <user> <project> [ count | #{@default_count} ]
    """
    System.halt(0)
  end

  def process({user, project, _count}) do
    Issues.GithubIssues.fetch(user, project)
    |> decode_response()
    |> sort_into_descending_order()
  end

  def decode_response({:ok, body}), do: body
  def decode_response({:error, error}) do
    IO.puts "Error fetching from Github: #{error["message"]}"
    System.halt(2)
  end

  def sort_into_descending_order(list_of_issues) do
    list_of_issues
    |> Enum.sort(fn i1, i2 ->
          i1["created_at"] >= i2["created_at"]
       end)
  end
end

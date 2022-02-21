defmodule Issues.CLI do
  @default_count 4
  @moduledoc """
  커맨드 라인 파싱을 수행한 뒤, 각종 함수를 호출해
  깃허브 프로젝트의 최근 _n_개 이슈를 표 형식으로 만들어 출력한다.
  """
  def run(argv) do
    parse_args(argv)
  end

  @doc """
  `argv`는 -h 또는 --help (이 경우 :help를 반환)이거나,
  깃허브 사용자 이름, 프로젝트 이름, (선택적으로) 가져올 이슈 개수여야 한다.

  `{사용자명, 프로젝트명, 이슈 개수}` 또는 :help를 반환한다.
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean], aliases: [ h: :help ])
    case parse do
    { [ help: true ], _, _ }
      -> :help
    { _, [ user, project, count ], _ }
      -> { user, project, count }
    { _, [ user, project ], _ }
      -> { user, project, @default_count }
    _ -> :help
    end
  end
end

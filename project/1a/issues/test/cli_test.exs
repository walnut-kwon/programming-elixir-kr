defmodule CliTest do
  use ExUnit.Case
  doctest Issues

  import Issues.CLI, only: [parse_args: 1]

  test "-h나 --help가 옵션으로 파싱되면 :help가 반환된다." do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "값을 3개 전달하면 값 3개가 반환된다." do
    assert parse_args(["user", "project", "99"]) == {"user", "project", 99}
  end

  test "값을 2개 전달하면 개수에 기본값을 사용한다." do
    assert parse_args(["user", "project"]) == {"user", "project", 4}
  end
end

defmodule IssuesTest do
  use ExUnit.Case
  doctest Issues

  test "greets the world" do
    assert Issues.hello() == :world
  end
end

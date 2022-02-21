defmodule BuggyTest do
  use ExUnit.Case
  doctest Buggy

  test "greets the world" do
    assert Buggy.hello() == :world
  end
end

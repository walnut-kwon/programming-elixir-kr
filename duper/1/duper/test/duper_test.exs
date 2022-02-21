defmodule DuperTest do
  use ExUnit.Case
  doctest Duper

  test "greets the world" do
    assert Duper.hello() == :world
  end
end

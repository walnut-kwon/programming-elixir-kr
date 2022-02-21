defmodule SimpleTest do
  use ExUnit.Case
  doctest Simple

  test "greets the world" do
    assert Simple.hello() == :world
  end
end

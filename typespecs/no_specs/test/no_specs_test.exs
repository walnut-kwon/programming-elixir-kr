defmodule NoSpecsTest do
  use ExUnit.Case
  doctest NoSpecs

  test "greets the world" do
    assert NoSpecs.hello() == :world
  end
end

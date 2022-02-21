defmodule SequenceTest do
  use ExUnit.Case
  doctest Sequence

  test "greets the world" do
    assert Sequence.hello() == :world
  end
end

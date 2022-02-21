defmodule MyAppTest do
  use ExUnit.Case
  doctest MyApp

  test "greets the world" do
    assert MyApp.hello() == :world
  end
end

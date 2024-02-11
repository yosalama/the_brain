defmodule TheBrainTest do
  use ExUnit.Case
  doctest TheBrain

  test "greets the world" do
    assert TheBrain.hello() == :world
  end
end

defmodule PhysicsTest do
  use ExUnit.Case, async: true
  doctest Physics

  test "Escape velocity of earth is correct" do
    ev = Physics.Rocketry.escape_velocity(:earth)
    assert ev == 11.2
  end

  test "Escape velocity of mars is correct" do
    ev = Physics.Rocketry.escape_velocity(:mars)
    assert ev == 5.0
  end

  test "Escape velocity of moon is correct" do
    ev = Physics.Rocketry.escape_velocity(:moon)
    assert ev == 2.4
  end

  test "Escape velocity of planet X is correct" do
    ev = %{mass: 4.0e22, radius: 6.21e6} |> Physics.Rocketry.escape_velocity()
    assert ev == 0.9
  end
end

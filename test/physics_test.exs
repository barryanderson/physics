defmodule PhysicsTest do
  use ExUnit.Case
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

  test "Converting to to_light_seconds" do
    ls = Converter.to_light_seconds({:miles, 1000}, precision: 5)
    assert ls == 0.00537
  end

  test "Converter works" do
    ls = Converter.to_light_seconds({:miles, 1000}, precision: 5)
    assert ls == 0.00537
  end

  test "Orbital acceleration for earth at 100km" do
    orbital_acc = Physics.Rocketry.orbital_acceleration(100)
    assert orbital_acc == 9.515619587729839
  end

  test "Orbital term for 100km above earth" do
    term = Physics.Rocketry.orbital_term(8000)
    assert (term > 4) && (term < 5)
  end
end

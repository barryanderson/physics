defmodule ConverterTest do
  use ExUnit.Case
  import Converter

  doctest Converter

  test "Converting to to_light_seconds" do
    ls = Converter.to_light_seconds({:miles, 1000}, precision: 5)
    assert ls == 0.00537
  end

  test "Converter works" do
    ls = Converter.to_light_seconds({:miles, 1000}, precision: 5)
    assert ls == 0.00537
  end

  test "rounding an integer" do
    val = 19 |> round_to
    assert val == 19
  end

  test "rounding a float" do
    val = 1.9 |> round_to
    assert val == 2.0
  end

  test "converting m to km" do
    val = 120.5 |> to_km
    assert val == 0.1205
  end
end

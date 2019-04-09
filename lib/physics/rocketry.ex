defmodule Converter do
  def to_nearest_tenth(value) do
    Float.ceil(value, 1)
  end

  def to_km(value) do
    value / 1000
  end

  def to_meters(value) do
    value * 1000
  end

  def to_light_seconds({:miles, miles} = value) do
    (miles * 5.36819e-6) |> round_up
  end

  def to_light_seconds({:meters, meters} = value) do
    (meters * 3.335638620368e-9) |> round_up
  end

  def to_light_seconds({:feet, feet} = value) do
    (feet * 1.016702651488166404e-9) |> round_up
  end

  def to_light_seconds({:inches, inches} = value) do
    (inches * 8.472522095734715723e-11) |> round_up
  end

  def round_up(value) when is_float(value), do: trunc(value)
end

defmodule ConverterTwo do
  # ...

  def to_light_seconds({unit, value}, precision: precision) do
    case unit do
      :miles -> from_miles(value)
      :meters -> from_meters(value)
      :feet -> from_feet(value)
      :inches -> from_inches(value)
    end
    |> round_to(precision)
  end

  defp from_miles(value), do: value * 5.36819e-6
  defp from_meters(value), do: value * 3.335638620368e-9
  defp from_feet(value), do: value * 1.016702651488166404e-9
  defp from_inches(value), do: value * 8.472522095734715723e-11
  defp round_to(value, precision), do: Float.round(value, precision)
end

defmodule Physics.Rocketry do
  def escape_velocity(:earth) do
    %{mass: 5.972e24, radius: 6.371e6}
    |> escape_velocity
  end

  def escape_velocity(planet) when is_map(planet) do
    planet
    |> calculate_escape
    |> Converter.to_km()
    |> Converter.to_nearest_tenth()
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    newtons_constant = 6.67e-11

    (2 * newtons_constant * mass / radius)
    |> :math.sqrt()
  end
end

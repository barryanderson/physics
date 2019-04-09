defmodule Converter do
  def to_nearest_tenth(value) do
    round_to(value, 1)
  end

  def to_km(value) when is_integer(value) or is_float(value) do
    value / 1000
  end

  def to_meters(value) do
    value * 1000
  end

  def to_light_seconds({:miles, miles} = _value, precision: precision) do
    (miles * 5.36819e-6) |> round_to(precision)
  end

  def to_light_seconds({:meters, meters} = _value, precision: precision) do
    (meters * 3.335638620368e-9) |> round_to(precision)
  end

  def to_light_seconds({:feet, feet} = _value, precision: precision) do
    (feet * 1.016702651488166404e-9) |> round_to(precision)
  end

  def to_light_seconds({:inches, inches} = _value, precision: precision) do
    (inches * 8.472522095734715723e-11) |> round_to(precision)
  end

  def seconds_to_hours(value) when is_integer(value) or is_float(value) do
    (value / 3600) |> to_nearest_tenth
  end

  def round_to(value, precision \\ 0)

  def round_to(value, _precision) when is_integer(value) do
    round(value)
  end

  def round_to(value, precision) when is_float(value) do
    Float.round(value, precision)
  end
end

# defmodule ConverterTwo do
#   # ...

#   def to_light_seconds({unit, value}, precision: precision) do
#     case unit do
#       :miles -> from_miles(value)
#       :meters -> from_meters(value)
#       :feet -> from_feet(value)
#       :inches -> from_inches(value)
#     end
#     |> round_to(precision)
#   end

#   defp from_miles(value), do: value * 5.36819e-6
#   defp from_meters(value), do: value * 3.335638620368e-9
#   defp from_feet(value), do: value * 1.016702651488166404e-9
#   defp from_inches(value), do: value * 8.472522095734715723e-11
#   defp round_to(value, precision), do: Float.round(value, precision)
# end

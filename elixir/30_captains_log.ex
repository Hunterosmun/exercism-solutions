# Concept: Erlang Libraries
# Concept: Randomness

defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class(), do: Enum.random(@planetary_classes)

  def random_ship_registry_number(), do: "NCC-#{Enum.random(1000..9999)}"

  def random_stardate(), do: generate_random(41000.0, 42000.0)

  # try 1
  # def format_stardate(stardate) when is_float(stardate), do: "#{Float.round(stardate, 1)}"
  # try 2
  # def format_stardate(stardate), do: "#{:io_lib.format(:io.format(:float), stardate, {:chars_limit, 6})}"
  # try 3
  def format_stardate(stardate), do: "#{:io_lib.format("~.1f", [stardate])}"

  defp generate_random(min, max), do: :rand.uniform() * (max - min + 1) + min
end

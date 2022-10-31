# Concept: Atoms
# Concept: Maps

defmodule ResistorColorDuo do
  @doc """
  Calculate a resistance value from two colors
  """
  @colors %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }
  @spec value(colors :: [atom]) :: integer
  def value([one | [two | _rest]]), do: String.to_integer("#{get_val(one)}#{get_val(two)}")
  defp get_val(atom), do: Map.fetch!(@colors, atom)
end

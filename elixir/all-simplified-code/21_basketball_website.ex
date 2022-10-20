# Concept: Access Behavior

defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    [current | rest] = String.split(path, ~r/\./)
    get_thing(data, current, rest)
  end

  defp get_thing(data, path, [current | rest]), do: get_thing(data[path], current, rest)

  defp get_thing(data, path, []), do: data[path]

  def get_in_path(data, path) do
    full_path = String.split(path, ~r/\./)
    Kernel.get_in(data, full_path)
  end
end

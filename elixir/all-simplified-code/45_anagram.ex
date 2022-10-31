# Concept: Strings
# Concept: Enum

defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.reduce(candidates, [], fn str, acc ->
      cond do
        String.downcase(str) == String.downcase(base) -> acc
        split_sort(str) == split_sort(base) -> [str | acc]
        true -> acc
      end
    end)
    |> Enum.reverse()
  end

  defp split_sort(str), do: String.downcase(str) |> String.split("", trim: true) |> Enum.sort()
end

# Concept: Cond
# Concept: Recursion
# Concept: Tuples

defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  # Try 1
  # ... I'm guessing I did this wrong?
  # def search(numbers, key) do
  #   numbers = Tuple.to_list(numbers)

  #   case Enum.any?(numbers, fn x -> x == key end) do
  #     true -> {:ok, Enum.find_index(numbers, fn x -> x == key end)}
  #     false -> :not_found
  #   end
  # end

  # Try 2
  # def search(numbers, key), do: search(numbers, key, 0)
  # def search({}, _, _), do: :not_found

  # def search(numbers, key, index_offset) do
  #   size = tuple_size(numbers)
  #   mid = div(size, 2)
  #   mid_val = elem(numbers, mid)
  #   {lower_list, upper_list} = numbers |> Tuple.to_list() |> Enum.split(mid)
  #   {_, upper_list} = List.pop_at(upper_list, 0)

  #   cond do
  #     mid_val == key -> {:ok, mid + index_offset}
  #     mid_val < key -> search(List.to_tuple(upper_list), key, index_offset + div(size, 2) + 1)
  #     mid_val > key -> search(List.to_tuple(lower_list), key, index_offset)
  #   end
  # end

  # Try 3
  def search(numbers, key), do: search(Tuple.to_list(numbers), key, 0)
  defp search([], _, _), do: :not_found

  defp search(numbers, key, index_offset) do
    mid = div(length(numbers), 2)
    {lower_list, upper_list} = numbers |> Enum.split(mid)
    [mid_val | upper_list] = upper_list

    cond do
      mid_val == key -> {:ok, mid + index_offset}
      mid_val < key -> search(upper_list, key, index_offset + mid + 1)
      mid_val > key -> search(lower_list, key, index_offset)
    end
  end
end

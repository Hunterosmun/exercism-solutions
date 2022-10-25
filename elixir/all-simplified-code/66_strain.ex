# Concept: Anonymous Functions
# Concept: Lists
# Concept: Recursion

defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)

  def keep(list, fun), do: do_keep(list, fun, [])

  defp do_keep([first | rest], fun, result) do
    new_result =
      case fun.(first) do
        true -> [first | result]
        false -> result
      end

    do_keep(rest, fun, new_result)
  end

  defp do_keep([], _fun, result), do: Enum.reverse(result)

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun), do: do_discard(list, fun, [])

  defp do_discard([first | rest], fun, result) do
    new_result =
      case fun.(first) do
        true -> result
        false -> [first | result]
      end

    do_discard(rest, fun, new_result)
  end

  defp do_discard([], _fun, result), do: Enum.reverse(result)
end

# Try 1 (didn't use Recursion)
# defmodule Strain do
#   @doc """
#   Given a `list` of items and a function `fun`, return the list of items where
#   `fun` returns true.

#   Do not use `Enum.filter`.
#   """
#   @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)

#   def keep(list, fun) do
#     new_list = []

#     Enum.flat_map(list, fn x ->
#       new_list =
#         case fun.(x) do
#           true -> [x | new_list]
#           false -> new_list
#         end
#     end)
#   end

#   @doc """
#   Given a `list` of items and a function `fun`, return the list of items where
#   `fun` returns false.

#   Do not use `Enum.reject`.
#   """
#   @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
#   def discard(list, fun) do
#     new_list = []

#     Enum.flat_map(list, fn x ->
#       new_list =
#         case fun.(x) do
#           false -> [new_list | x]
#           true -> new_list
#         end
#     end)
#   end
# end

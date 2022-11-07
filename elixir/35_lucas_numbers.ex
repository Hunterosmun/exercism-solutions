# Concept: Streams

defmodule LucasNumbers do
  @moduledoc """
  Lucas numbers are an infinite sequence of numbers which build progressively
  which hold a strong correlation to the golden ratio (φ or ϕ)

  E.g.: 2, 1, 3, 4, 7, 11, 18, 29, ...
  """
  def generate(count) when count < 0 or not is_integer(count) do
    raise ArgumentError, "count must be specified as an integer >= 1"
  end

  def generate(count) do
    Stream.iterate({2, 1}, fn {one, two} -> {two, one + two} end)
    # |> Stream.map(&elem(&1, 0)) could do this here instead of the Enum.map() below
    |> Enum.take(count)
    |> Enum.map(&elem(&1, 0))
  end
end

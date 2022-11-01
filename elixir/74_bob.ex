# Concept: Booleans
# Concept: Conds

defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    inp = String.trim(input)
    all_caps = not String.match?(inp, ~r/[[:lower:]]/) and String.match?(inp, ~r/[[:alpha:]]/)

    cond do
      inp == "" -> "Fine. Be that way!"
      all_caps and String.last(inp) == "?" -> "Calm down, I know what I'm doing!"
      all_caps -> "Whoa, chill out!"
      String.last(inp) == "?" -> "Sure."
      true -> "Whatever."
    end
  end
end

# Try 1
# def hey(input) do
#   input = String.trim(input)
#   question = String.last(input) == "?"
#   has_letters = input |> String.split("") |> Enum.any?(fn x -> x =~ ~r/([[:alpha:]])/ end)
#   has_lower = input |> String.split("") |> Enum.any?(fn x -> x =~ ~r/[[:lower:]]/ end)
#   all_caps = has_letters and not has_lower

#   cond do
#     input == "" -> "Fine. Be that way!"
#     all_caps and question -> "Calm down, I know what I'm doing!"
#     all_caps -> "Whoa, chill out!"
#     question -> "Sure."
#     true -> "Whatever."
#   end
# end

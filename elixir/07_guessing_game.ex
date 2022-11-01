# Concept: Default Arguments
# Concept: Guards
# Concept: Multiple Clause Functions

defmodule GuessingGame do
  def compare(secret_number, guess \\ :no_guess) do
    cond do
      guess === secret_number -> "Correct"
      guess === :no_guess -> "Make a guess"
      guess in [secret_number - 1, secret_number + 1] -> "So close"
      guess < secret_number -> "Too low"
      guess > secret_number -> "Too high"
    end
  end
end

# TO DO: Redo this to better understand the concepts

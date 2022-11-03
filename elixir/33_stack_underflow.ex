# Concept: Exceptions

defmodule RPNCalculator.Exception do
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    defexception message: "stack underflow occurred"

    def exception(val) do
      case val do
        [] -> %StackUnderflowError{}
        _ -> %StackUnderflowError{message: "stack underflow occurred, context: #{val}"}
      end
    end
  end

  def divide([one, two]) when one == 0 or two == 0, do: raise(DivisionByZeroError)
  def divide([one, two]), do: div(two, one)
  def divide(_), do: raise(StackUnderflowError, "when dividing")
end

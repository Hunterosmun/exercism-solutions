# Concept: AST

defmodule TopSecret do
  def to_ast(string), do: Code.string_to_quoted!(string)

  def decode_secret_message_part(ast, acc) do
    acc =
      case ast do
        {:defp, name} -> [name, acc]
        {:def, name} -> [name, acc]
        _ -> acc
      end

    {ast, acc}
  end

  def decode_secret_message(string) do
    #
  end
end

# AST being recieved
# bleh = {:defp, [line: 1], [{:op, [line: 1], [{:a, [line: 1], nil}, {:b, [line: 1], nil}]}, [do: 2]]}

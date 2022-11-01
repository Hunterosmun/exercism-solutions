# Concept: AST

defmodule TopSecret do
  def to_ast(string), do: Code.string_to_quoted!(string)

  def decode_secret_message_part(ast, acc) do
    secrets =
      ast
      |> break_down()
      |> Enum.map(fn {name, _, arity} ->
        arity_length = if arity == nil, do: 0, else: length(arity)
        name |> to_string() |> String.slice(0, arity_length)
      end)

    {ast, secrets ++ acc}
  end

  def decode_secret_message(string) do
    string
    |> to_ast()
    |> chunk_small()
    |> Enum.map(&(decode_secret_message_part(&1, []) |> elem(1)))
    |> Enum.join()
  end

  defp break_down(ast) do
    case ast do
      {:def, _, [{:when, _, [thing, _]}, _]} -> [thing]
      {:def, _, [thing, _]} -> [thing]
      {:defp, _, [{:when, _, [thing, _]}, _]} -> [thing]
      {:defp, _, [thing, _]} -> [thing]
      ast when is_list(ast) -> Enum.flat_map(ast, &break_down/1)
      _ -> []
    end
  end

  defp chunk_small(ast) do
    case ast do
      {:do, {:__block__, _, thing}} -> [thing]
      {:do, thing} -> [thing]
      {:__block__, _, stuff} -> chunk_small(stuff)
      {:defmodule, _, thing} -> chunk_small(thing)
      ast when is_list(ast) -> Enum.flat_map(ast, &chunk_small/1)
      _ -> [ast]
    end
  end
end

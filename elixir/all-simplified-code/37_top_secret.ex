# Concept: AST

defmodule TopSecret do
  def to_ast(string), do: Code.string_to_quoted!(string)

  def decode_secret_message_part(ast, acc) do
    {type, _, func} = ast

    acc =
      case type do
        :def -> filter_decode(func, acc)
        :defp -> filter_decode(func, acc)
        _ -> acc
      end

    {ast, acc}
  end

  defp filter_decode(func, acc) do
    [{type, _, other} | _] = func

    case type do
      :when -> super_decode(other, acc)
      _ -> super_decode(func, acc)
    end
  end

  defp super_decode(func, acc) do
    [{name, _, arity} | _] = func
    arity_length = if arity == nil, do: 0, else: length(arity)
    name = name |> to_string() |> String.slice(0, arity_length)
    [name | acc]
  end

  def decode_secret_message(string) do
    string
    |> to_ast()
    |> break_down()
    |> Enum.flat_map(fn l ->
      {_, acc} = decode_secret_message_part(l, [])
      acc
    end)
    |> Enum.join()
  end

  defp break_down({first, _, last} = ast) do
    case first do
      :def -> [ast]
      :defp -> [ast]
      :defmodule -> break_down(last)
      :__block__ -> break_down(last)
      _ -> []
    end
  end

  defp break_down({:do, thing}), do: break_down(thing)
  defp break_down(list), do: Enum.flat_map(list, fn l -> break_down(l) end)
end

# Concept: Tail Call Recursion
# Concept: Bit Strings

defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?  -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> 32
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
      _ -> nil
    end
  end

  def encode(dna), do: do_encode(dna, <<>>)

  defp do_encode([head | tail], result) do
    do_encode(tail, <<result::bitstring, encode_nucleotide(head)::4>>)
  end

  defp do_encode([], result), do: result

  def decode(dna), do: do_decode(dna, [])

  defp do_decode(<<value::4, rest::bitstring>> = dna, result) do
    do_decode(rest, [decode_nucleotide(value) | result])
  end

  defp do_decode(<<>>, result), do: Enum.reverse(result)
end

#  8   7  6  5 4 3 2 1
# 128 64 32 16 8 4 2 1
# <<132, 2, 1::size(4)>>
# 1000 0100 "TG"
# 0000 0010 " C"
# 0001 "A"

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

  def encode(dna) do
    dna
    |> Enum.map(fn x -> encode_nucleotide(x) end)
    |> IO.inspect()

    # do_encode(dna, [])
    # |> IO.inspect()
    # |> do_count([])
    # |> IO.inspect()
  end

  defp do_encode([head | tail], result), do: do_encode(tail, [encode_nucleotide(head) | result])
  defp do_encode([], result), do: result

  # defp do_count([one | two | tail], acc) do
  #   if two, do: do_count(tail, [acc | one + two]), else: [acc | one :: size(4)]
  # end

  def decode(dna) do
    # Please implement the decode/1 function
  end
end

#  8   7  6  5 4 3 2 1
# 128 64 32 16 8 4 2 1
# <<132, 2, 1::size(4)>>
# 1000 0100 "TG"
# 0000 0010 " C"
# 0001 "A"

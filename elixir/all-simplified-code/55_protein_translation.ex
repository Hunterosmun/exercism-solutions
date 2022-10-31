# Concept: Case
# Concept: Pattern Matching

defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {:ok, list(String.t())} | {:error, String.t()}
  def of_rna(rna), do: of_rna(rna, [])

  defp of_rna("", acc), do: {:ok, Enum.reverse(acc)}

  defp of_rna(rna, acc) do
    {codon, rest} = String.split_at(rna, 3)
    less_than_three = String.length(codon) < 3

    case codon do
      codon when less_than_three -> {:error, "invalid RNA"}
      "UGU" -> of_rna(rest, ["Cysteine" | acc])
      "UGC" -> of_rna(rest, ["Cysteine" | acc])
      "UUA" -> of_rna(rest, ["Leucine" | acc])
      "UUG" -> of_rna(rest, ["Leucine" | acc])
      "AUG" -> of_rna(rest, ["Methionine" | acc])
      "UUU" -> of_rna(rest, ["Phenylalanine" | acc])
      "UUC" -> of_rna(rest, ["Phenylalanine" | acc])
      "UCU" -> of_rna(rest, ["Serine" | acc])
      "UCC" -> of_rna(rest, ["Serine" | acc])
      "UCA" -> of_rna(rest, ["Serine" | acc])
      "UCG" -> of_rna(rest, ["Serine" | acc])
      "UGG" -> of_rna(rest, ["Tryptophan" | acc])
      "UAU" -> of_rna(rest, ["Tyrosine" | acc])
      "UAC" -> of_rna(rest, ["Tyrosine" | acc])
      "UAA" -> of_rna("", acc)
      "UAG" -> of_rna("", acc)
      "UGA" -> of_rna("", acc)
      _ -> {:error, "invalid RNA"}
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def of_codon(codon) do
    case codon do
      "UGU" -> {:ok, "Cysteine"}
      "UGC" -> {:ok, "Cysteine"}
      "UUA" -> {:ok, "Leucine"}
      "UUG" -> {:ok, "Leucine"}
      "AUG" -> {:ok, "Methionine"}
      "UUU" -> {:ok, "Phenylalanine"}
      "UUC" -> {:ok, "Phenylalanine"}
      "UCU" -> {:ok, "Serine"}
      "UCC" -> {:ok, "Serine"}
      "UCA" -> {:ok, "Serine"}
      "UCG" -> {:ok, "Serine"}
      "UGG" -> {:ok, "Tryptophan"}
      "UAU" -> {:ok, "Tyrosine"}
      "UAC" -> {:ok, "Tyrosine"}
      "UAA" -> {:ok, "STOP"}
      "UAG" -> {:ok, "STOP"}
      "UGA" -> {:ok, "STOP"}
      _ -> {:error, "invalid codon"}
    end
  end
end

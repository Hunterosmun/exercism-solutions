# Concept: Pipe Operator
# Concept: Strings

defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
      |> String.trim_leading
      |> String.first
  end
  def initial(name) do
    name
      |> first_letter
      |> String.capitalize
      |> (&(&1<>".")).()
  end
  def initials(full_name) do
    full_name
      |> String.split
      |> Enum.map(fn x -> initial(x) end)
      |> Enum.join(" ")
  end
  def pair(full_name1, full_name2) do
    n1 = initials(full_name1)
    n2 = initials(full_name2)
    "     ******       ******\n   **      **   **      **\n **         ** **         **\n**            *            **\n**                         **\n**     #{n1}  +  #{n2}     **\n **                       **\n   **                   **\n     **               **\n       **           **\n         **       **\n           **   **\n             ***\n              *\n"
  end
end

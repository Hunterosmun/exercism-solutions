# Concept: Regular Expressions

defmodule LogParser do
  def valid_line?(line), do: String.match?(line, ~r/^\[DEBUG|INFO|WARNING|ERROR\]/)

  def split_line(line), do: Regex.split(~r/<[~*=-]*>/, line)

  def remove_artifacts(line), do: Regex.replace(~r/end-of-line[\d]+/i, line, "")

  def tag_with_user_name(line) do
    if String.match?(line, ~r/User/) do
      [_ | name] = Regex.run(~r/User\s+([\S]*)/u, line)
      "[USER] #{name} #{line}"
    else
      line
    end
  end
end

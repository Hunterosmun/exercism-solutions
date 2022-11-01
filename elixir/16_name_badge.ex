# Concept: If
# Concept: Nil

defmodule NameBadge do
  # def print(id, name, department) when department === nil and id === nil, do: "#{name} - OWNER"
  # def print(id, name, department) when department === nil, do: "[#{id}] - #{name} - OWNER"
  # def print(id, name, department) when id === nil, do: "#{name} - #{String.upcase(department)}"
  # def print(id, name, department), do: "[#{id}] - #{name} - #{String.upcase(department)}"

  def print(id, name, department) do
    department = if department, do: "#{String.upcase(department)}", else: "OWNER"
    id = if id, do: "[#{id}] - ", else: ""
    "#{id}#{name} - #{department}"
  end

  # def print(id, name, department) do
  # if id === nil and department === nil do
  #  "#{name} - OWNER"
  # else
  #  if id === nil do
  #    "#{name} - #{String.upcase(department)}"
  #  else
  #    if department === nil do
  #      "[#{id}] - #{name} - OWNER"
  #    else
  #      "[#{id}] - #{name} - #{String.upcase(department)}"
  #    end
  #  end
  # end
  # end
end

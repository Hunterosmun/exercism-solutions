defmodule RPG.CharacterSheet do
  def welcome(), do: IO.puts("Welcome! Let's fill out your character sheet together.")
  def ask_name(), do: ask_and_trim("What is your character's name?\n")
  def ask_class(), do: ask_and_trim("What is your character's class?\n")
  def ask_level(), do: String.to_integer(ask_and_trim("What is your character's level?\n"))

  def ask_and_trim(question) do
    IO.gets(question)
      |>String.trim()
  end

  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()
    %{class: class, level: level, name: name}
      |> IO.inspect(label: "Your character")
  end
end

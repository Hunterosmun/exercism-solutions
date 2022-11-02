# Concept: Protocols

defmodule RPG do
  defmodule Character do
    defstruct health: 100, mana: 0
  end

  defmodule LoafOfBread do
    defstruct []
  end

  defmodule ManaPotion do
    defstruct strength: 10
  end

  defmodule Poison do
    defstruct []
  end

  defmodule EmptyBottle do
    defstruct []
  end

  #  Here and up is pre-written code
  # Add code to define the protocol and its implementations below here...
  defprotocol Edible do
    def eat(item, character)
  end

  defimpl Edible, for: RPG.LoafOfBread do
    def eat(_item, %{health: health} = character) do
      {nil, %{character | health: health + 5}}
    end
  end

  defimpl Edible, for: RPG.ManaPotion do
    def eat(%{strength: strength}, %{mana: mana} = character) do
      {%RPG.EmptyBottle{}, %{character | mana: mana + strength}}
    end
  end

  defimpl Edible, for: RPG.Poison do
    def eat(_item, character) do
      {%RPG.EmptyBottle{}, %{character | health: 0}}
    end
  end
end

defmodule KitchenCalculator do
  def get_volume({_, amount}), do: amount

  def to_milliliter({:cup, amount}), do: {:milliliter, amount * 240}
  def to_milliliter({:fluid_ounce, amount}), do: {:milliliter, amount * 30}
  def to_milliliter({:teaspoon, amount}), do: {:milliliter, amount * 5}
  def to_milliliter({:tablespoon, amount}), do: {:milliliter, amount * 15}
  def to_milliliter({:milliliter, amount}), do: {:milliliter, amount}

  def from_milliliter({:milliliter, unit}, :cup), do: {:cup, unit / 240}
  def from_milliliter({:milliliter, unit}, :fluid_ounce), do: {:fluid_ounce, unit / 30}
  def from_milliliter({:milliliter, unit}, :teaspoon), do: {:teaspoon, unit / 5}
  def from_milliliter({:milliliter, unit}, :tablespoon), do: {:tablespoon, unit / 15}
  def from_milliliter({:milliliter, unit}, :milliliter), do: {:milliliter, unit}

  def convert(from, to) do
    from |> to_milliliter() |> from_milliliter(to)
  end
end

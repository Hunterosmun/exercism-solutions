# Concept: Maps
# Concept: Module Attributes As Constants

defmodule HighScore do
  def new(), do: %{}
  def add_player(scores, name, score \\ 0), do: Map.merge(scores, %{name => score})
  def remove_player(scores, name), do: Map.delete(scores, name)
  def reset_score(scores, name), do: Map.put(scores, name, 0)

  def update_score(scores, name, score) do
    old_score = Map.get(scores, name, 0)
    Map.put(scores, name, score + old_score)
    # Map.get_and_update(scores, name, fn val -> val + score end)
  end

  def get_players(scores), do: Map.keys(scores)
end

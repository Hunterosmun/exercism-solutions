# Concept: Agents

# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  # if we put a `use Agent` here and changed `Agent.start` to `Agent.start_link` we would have an easier time getting this into a supervisor tree
  # This is because it would give you a default child_spec, which supervisors need
  def start(opts \\ []) do
    Agent.start(fn -> {1, opts} end)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn {_, list} -> list end)
  end

  def register(pid, register_to) do
    # Agent.get_and_update -> In the anonymous function you need to return a tuple.
    # First thing in that tuple is what you return from the function,
    # the second is how you want to update your state
    Agent.get_and_update(pid, fn {id, list} ->
      {%Plot{plot_id: id, registered_to: register_to},
       {id + 1, [%Plot{plot_id: id, registered_to: register_to} | list]}}
    end)
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn {id, plots} ->
      {id, Enum.filter(plots, fn p -> p.plot_id != plot_id end)}
    end)
  end

  def get_registration(pid, plot_id) do
    list_registrations(pid)
    |> Enum.find(
      {:not_found, "plot is unregistered"},
      fn %Plot{plot_id: id, registered_to: _} -> id == plot_id end
    )
  end
end

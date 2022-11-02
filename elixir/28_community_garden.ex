# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Counter.start_link(0)
    Agent.start(fn -> opts end)
  end

  def list_registrations(pid) do
    Agent.get(pid, & &1)
  end

  def register(pid, register_to) do
    Counter.increment()
    new_entry = %Plot{plot_id: Counter.value(), registered_to: register_to}
    Agent.update(pid, fn x -> [new_entry | x] end)
    new_entry
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn plots -> Enum.filter(plots, fn p -> p.plot_id != plot_id end) end)
  end

  def get_registration(pid, plot_id) do
    list_registrations(pid)
    |> Enum.find(
      {:not_found, "plot is unregistered"},
      fn %Plot{plot_id: id, registered_to: _} -> id == plot_id end
    )
  end
end

defmodule Counter do
  use Agent

  def start_link(initial_value) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def value do
    Agent.get(__MODULE__, & &1)
  end

  def increment do
    Agent.update(__MODULE__, &(&1 + 1))
  end
end

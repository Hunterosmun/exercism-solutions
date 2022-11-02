# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    # could have used __MODULE__ instead of :Count, but this way seemed more clear
    Agent.start_link(fn -> 0 end, name: :Count)
    Agent.start(fn -> opts end)
  end

  def list_registrations(pid) do
    Agent.get(pid, & &1)
  end

  def register(pid, register_to) do
    Agent.update(:Count, &(&1 + 1))
    new_entry = %Plot{plot_id: Agent.get(:Count, & &1), registered_to: register_to}
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

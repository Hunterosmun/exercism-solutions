# Concept: Structs

defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, distance_driven_in_meters: 0, battery_percentage: 100]

  def new(nickname \\ "none"), do: %RemoteControlCar{nickname: nickname}

  @spec display_distance(%RemoteControlCar{}) :: String.t()
  def display_distance(%RemoteControlCar{distance_driven_in_meters: distance}) do
    "#{distance} meters"
  end

  @spec display_battery(%RemoteControlCar{}) :: String.t()
  def display_battery(%RemoteControlCar{battery_percentage: battery}) do
    case battery do
      0 -> "Battery empty"
      _ -> "Battery at #{battery}%"
    end
  end

  def drive(%RemoteControlCar{battery_percentage: b, distance_driven_in_meters: d} = car) do
    case b do
      0 -> %{car | battery_percentage: b, distance_driven_in_meters: d}
      _ -> %{car | battery_percentage: b - 1, distance_driven_in_meters: d + 20}
    end
  end
end

# Concept: Dates and Time

defmodule LibraryFees do
  @spec datetime_from_string(String.t()) :: %NaiveDateTime{}
  def datetime_from_string(string) do
    {:ok, datetime, 0} = DateTime.from_iso8601(string)
    DateTime.to_naive(datetime)
    # string
    #   |> DateTime.from_iso8601()
    #   |> DateTime.to_naive()
  end

  @spec before_noon?(%NaiveDateTime{}) :: boolean()
  def before_noon?(datetime) do
    # try 1
    # {:ok, date_type} = DateTime.from_naive(datetime, "Etc/UTC")
    # time_type = DateTime.to_time(date_type)
    # time_type.hour < 12

    # try 2
    # datetime
    # |> DateTime.from_naive("Etc/UTC")
    # |> Tuple.to_list()
    # |> List.last()
    # |> DateTime.to_time()
    # |> (&(&1.hour < 12)).()

    # try 2.5
    # datetime
    # |> DateTime.from_naive("Etc/UTC")
    # |> elem(1)
    # |> DateTime.to_time()
    # |> then(&(&1.hour < 12))

    # try 3
    # datetime
    # |> DateTime.from_naive!("Etc/UTC")
    # |> DateTime.to_time()
    # |> then(&(&1.hour < 12))

    datetime.hour < 12
    # ... . . . wow. Yeah. This is awkward...
  end

  @spec return_date(%NaiveDateTime{}) :: %DateTime{}
  def return_date(checkout_datetime) do
    num =
      case before_noon?(checkout_datetime) do
        true -> 28
        false -> 29
      end

    checkout_datetime
    |> NaiveDateTime.add(num, :day)
    |> DateTime.from_naive!("Etc/UTC")
    |> DateTime.to_date()
  end

  @spec days_late(%DateTime{}, %NaiveDateTime{}) :: integer()
  def days_late(planned_return_date, actual_return_datetime) do
    real_return =
      actual_return_datetime
      |> DateTime.from_naive!("Etc/UTC")

    {:ok, real_planned} =
      planned_return_date
      |> DateTime.new(~T[00:00:00.0])

    DateTime.diff(real_return, real_planned, :day)
    |> then(fn num ->
      case num > 0 do
        true -> num
        false -> 0
      end
    end)
  end

  @spec monday?(%NaiveDateTime{}) :: boolean()
  def monday?(datetime), do: Date.day_of_week(datetime) == 1

  @spec calculate_late_fee(String.t(), String.t(), integer()) :: integer()
  def calculate_late_fee(checkout, return, rate) do
    real_return = return |> datetime_from_string()
    agreed_return = checkout |> datetime_from_string() |> return_date()
    base_cost = days_late(agreed_return, real_return)

    case monday?(real_return) do
      true -> Float.floor(base_cost * rate / 2)
      false -> base_cost * rate
    end
  end
end

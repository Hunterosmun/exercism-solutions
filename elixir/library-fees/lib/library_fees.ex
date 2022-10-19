defmodule LibraryFees do
  def datetime_from_string(string) do
    {:ok, datetime, 0} = DateTime.from_iso8601(string)

    DateTime.to_naive(datetime)
  end

  def before_noon?(datetime) do
    if datetime.hour() >= 12, do: false, else: true
  end

  def return_date(checkout_datetime) do
    days = if before_noon?(checkout_datetime), do: 28 * 86400, else: 29 * 86400

    NaiveDateTime.add(checkout_datetime, days)
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    inDay = planned_return_date.day()
    realDay = actual_return_datetime.day()
    if actual_return_datetime.day() === planned_return_date.day(), do: 0, else: realDay - inDay

    # DateTime.diff(planned_return_date, actual_return_datetime)
    # |> IO.inspect()
  end

  def monday?(datetime) do
    # Please implement the monday?/1 function
  end

  def calculate_late_fee(checkout, return, rate) do
    # Please implement the calculate_late_fee/3 function
  end
end

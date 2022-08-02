defmodule FreelancerRates do
    # a month has 22 billable days
    # The daily rate is 8X the hourly
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do

    # try 1
    #filtered_discount = if discount > 0, do: discount, else: 1
    #discount_amount = before_discount / filtered_discount
    #before_discount - discount_amount

    # try 2
    before_discount * ((100.0 - discount)/100)

    # try 3 (each try works)
    #before_discount - (before_discount * (discount/100))
  end

  def monthly_rate(hourly_rate, discount) do
    apply_discount(hourly_rate * 22 * 8, discount) |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    # divide = fn num -> budget / num end
    hourly_rate
    |> daily_rate
    |> apply_discount(discount)
    |> then(&(budget / &1))
    |> Float.floor(1)
  end
end

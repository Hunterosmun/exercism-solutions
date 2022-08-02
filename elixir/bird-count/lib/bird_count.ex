defmodule BirdCount do
  def today([]), do: nil
  def today([head | _tail]), do: head

  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

@doc """
  def has_day_without_birds?(list) do
    list 
      |> Enum.filter(fn val -> val === 0 end) 
      |> Enum.count() 
      |> (&(&1 >= 1)).() 
    # (&(&1 >= 1)).()
    # could also do then(& &1 >= 1)
    # could also be (fn val -> val >= 1 end).()
  end 
"""

  def has_day_without_birds?([0 | _tail]), do: true
  def has_day_without_birds?([_head | tail]), do: has_day_without_birds?(tail)
  def has_day_without_birds?([]), do: false

  # def total([head | tail]), do: total(tail, 0 + head)
  def total(list, count \\ 0)
  def total([head | tail], count), do: total(tail, count + head)
  def total([], count), do: count


  #def busy_days(list), do: busy_days(list, 0)
  def busy_days(list, count \\ 0)
  def busy_days([head | tail], count) when head > 4, do: busy_days(tail, count + 1)
  def busy_days([head | tail], count), do: busy_days(tail, count)
  def busy_days([], count), do: count
  
end

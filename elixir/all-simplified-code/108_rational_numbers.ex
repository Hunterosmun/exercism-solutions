# Concepts: Basics

defmodule RationalNumbers do
  @type rational :: {integer, integer}
  # rational numbers are: {numerator, denominator}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({f_num, f_denom}, {s_num, s_denom}) do
    reduce({f_num * s_denom + s_num * f_denom, f_denom * s_denom})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({f_num, f_denom}, {s_num, s_denom}) do
    reduce({f_num * s_denom - s_num * f_denom, f_denom * s_denom})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({f_num, f_denom}, {s_num, s_denom}), do: reduce({f_num * s_num, f_denom * s_denom})

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({f_num, f_denom}, {s_num, s_denom}) do
    reduce({f_num * s_denom, s_num * f_denom})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({num, denom}), do: reduce({Kernel.abs(num), Kernel.abs(denom)})

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({num, denom}, n) when n > -1, do: reduce({num ** n, denom ** n})
  def pow_rational({num, denom}, n), do: reduce({denom ** Kernel.abs(n), num ** Kernel.abs(n)})

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {num, denom}), do: x ** (num / denom)

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({num, _denom}) when num == 0, do: {num, 1}
  def reduce({_num, denom}) when denom == 0, do: {1, denom}
  def reduce({num, denom}) when denom < 0, do: reduce({-num, Kernel.abs(denom)})
  def reduce({num, denom}), do: {div(num, gcd({num, denom})), div(denom, gcd({num, denom}))}

  # Greatest Common Denominator
  # looks like it's either the smaller number -OR- the absolute value of the difference between the numbers
  defp gcd({num, denom}) do
    diff = (Kernel.abs(num) - Kernel.abs(denom)) |> Kernel.abs()

    cond do
      rem(num, denom) == 0 -> Kernel.abs(denom)
      rem(denom, num) == 0 -> Kernel.abs(num)
      rem(num, diff) == 0 and rem(denom, diff) == 0 -> diff
      true -> 1
    end
  end
end

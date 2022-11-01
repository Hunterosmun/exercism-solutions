# Concept: Keyword Lists

defmodule WineCellar do
  import Keyword

  def explain_colors do
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end

  def filter(cellar, color, opts \\ []) do
    year = get(opts, :year)
    country = get(opts, :country)

    # try 1
    # cellar = get_values(cellar, color)
    # cellar = if year, do: filter_by_year(cellar, year), else: cellar
    # if country, do: filter_by_country(cellar, country), else: cellar

    # try 2
    # get_values(cellar, color)
    # |> when_real(fn x, y -> filter_by_year(x, y) end, year)
    # |> when_real(fn x, y -> filter_by_country(x, y) end, country)

    # try 3
    get_values(cellar, color)
    |> when_real(&filter_by_year/2, year)
    |> when_real(&filter_by_country/2, country)
  end

  def when_real(val, func, option), do: if(option, do: func.(val, option), else: val)

  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end

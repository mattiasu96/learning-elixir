defmodule Sample.Calendar do # Module names must be all camel case
  def is_leap_year(year) when rem(year, 400) == 0, do: true # rem is the remainder of dividing by the given number
  def is_leap_year(year) when rem(year, 100) == 0, do: false
  def is_leap_year(year) when rem(year, 4) == 0, do: true
  def is_leap_year(year), do: false
end

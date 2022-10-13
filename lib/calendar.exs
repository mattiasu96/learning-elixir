defmodule Sample.Calendar do # Module names must be all camel case
  def is_leap_year(year) when rem(year, 400) == 0, do: true # rem is the remainder of dividing by the given number
  def is_leap_year(year) when rem(year, 100) == 0, do: false
  def is_leap_year(year) when rem(year, 4) == 0, do: true
  def is_leap_year(year), do: false

  def day_abbreviation(day) do
    cond do # Cond allows me to write nested multiple condition in a much nicer way than 300 nested if/else
      day == :Monday -> "M"
      day == :Tuesday -> "Tu"
      day == :Wednesday -> "W"
      day == :Thursday -> "Th"
      day == :Friday -> "F"
      day == :Saturday -> "Sa"
      day == :Sunday -> "Su"
      true -> "Invalid day" # Fallback value if none of the previous conditions is met
    end

  end
end

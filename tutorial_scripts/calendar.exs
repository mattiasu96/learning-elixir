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

  def describe_date(date) do # This kind of pattern matching is pretty useful when reading files!
    case date do # case date parses the content of date basically and uses it as the left part of the matchings
      {1, _, _} -> "Brand new month!"
      {25, 12, _} -> "Merry christmas!"
      {25, month, _} -> "only #{12 - month} until christmas!"
      {17, 05, 1996} -> "The great Surricchio is born"
      {31, 10, _} -> "Brand new month!"
      {_, month, _}  when month < 12 -> "average daaay!"
      {day, month, _}  when month == 12 and day < 25 -> "christmas is coming!!"
      {_, _, _} -> "Invalid month"
    end

  end

  def send_tweet(path) do
    case File.read(path) do  # Here as case I have the outcome of the file read. Then I have the two tuples with atom + values and I perform pattern matching
       {:ok, data} -> Tweet.send(data)
       {:error, error} -> IO.puts "Could not send tweet"
    end

  end
end

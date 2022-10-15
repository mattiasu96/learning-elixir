defmodule Sample.Lyrics do

  def sing_lyrics([head | tail]) when length([head | tail]) == 2 do
    IO.puts "2 bottle of beer on the wall, 2 bottle of beer. Take one down, pass it around, one more bottles on the wall"
    sing_lyrics(tail)
  end

  def sing_lyrics([head | tail]) when length([head | tail]) == 1 do
    IO.puts "1 bottle of beer on the wall, 1 bottle of beer. Take one down, pass it around, no more bottles on the wall"
  end

  def sing_lyrics([head | tail]) do
    IO.puts "#{length([head | tail])} bottles of beer on the wall, #{length([head | tail])} bottles of beer. Take one down, pass it around,
    #{length(tail)} on the wall"
    sing_lyrics(tail)
  end


end

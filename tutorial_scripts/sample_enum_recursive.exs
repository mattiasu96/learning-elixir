defmodule Sample.Enum do

  # simple example of recursion + pattern matching
  # Basically I define the map on a list + function, then with pattern matching I recursively apply
  # my function to the head of my sublist.
  # Once my recursion is done, I'll reach a point where I have an empty list, in that case pattern matching will match with
  # the other function map.
  def map([], _), do: []
  def map([hd|tl], f) do
    [f.(hd) | map(tl,f)]
  end

end

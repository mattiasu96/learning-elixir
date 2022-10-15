defmodule Sample.Enum do
  import Kernel, except: [length: 1] # Removing which import I dont need

  def length([]), do: 0

  # This is called body recursion. This is the standard recursion approach and can cause many problems.
  # The first problem is that with big chunk of data to process, I call multiple time the function and instantiate the stack
  # I will soon run in stackoverflow. This is caused because the recursion needs to reach the base case first, and only at that moment
  # it will start to return and perform the real computation.
  def length([ _ | tail]),
      do: 1+length(tail) # Here the last operation done by the function is a sum -> no tail recursion


  # A tail recursion on the other hand, does not overflow the stack in elixir, cuz it is able to run it without allocating
  # stuff on the stack. Tail recursion happens only when the LAST operation a function performs is recursion.
  # Btw, why should I use a body recursion if the tail one seems just better? Because the tail one for the map case returns the results in opposite order
  def length_tail_recursive([ _ | tail]),
    do: length_tail_recursive(tail, 1) # In these cases the very last operation is directly the recursion, so no problems

  def length_tail_recursive([], sum),
    do: sum

  def length_tail_recursive([_ | tail], sum),
    do: length_tail_recursive(tail, sum+1)


  # Map with plain recursion
  def map([], _), do: []
  def map([hd|tl], f) do
    [f.(hd) | map(tl,f)]
  end

  # Map with tail recursion

  def reverse(list) do
    reverse(list, [])
  end

  def reverse([], reversed) do
    reversed
  end

  def reverse([head | tail], reversed) do
    # The logic is that im impiling stuff in the reversed "buffer"! What happens is that I get the head of the current list (that should become the tail)
    # And I place it at the head + reversed. At the next recursive step, head == reversed, so it will be in the second position wrt the new head,
    # and then again and again, the new heads "slips" further in the list, and i obtain a reverse order.
    reverse(tail, [head | reversed])
  end

  def map_tail_recursion([], _, result) do
    reverse(result)
  end

  def map_tail_recursion([ head | tail], f) do
    map_tail_recursion(tail, f, [f.(head)])
  end

  def map_tail_recursion([ head | tail], f, result) do
    # NB: I can't do the other way around to avoid inverse positioning of my results!
    # This is because [head | tail] of [1,2,3] == [1 | [2,3]], the head is the single element and tail is all the rest.
    # So in the code belove if I invert the f.(head) with result, I aint appending a single element in the tail, but I'll append a whole list and end up
    # with a nested list. Remember that elixir has only one directional list, thus insert in the head is much faster.
    map_tail_recursion(tail, f, [f.(head) | result])
  end


end

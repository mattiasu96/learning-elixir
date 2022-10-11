# Function Arity: in elixir I can rename function as {function name} / {number of parameters}.
# As an example, the first() function below in elixir is represented as first/1. When I declare another function called first
# with 2 arguments, I will have first/2 and elixir will call the right one based on the matching of the function parameters.


defmodule Sample.Enum do
  # Instead of doing if else like in imperative languages, I create another identical function with pattern matching
  # In case of empty list this function version will be executed

  # def first([]) do
  #   nil
  # end

  # def first([head | _]) do # Pattern matching!
  #   hd(list) # No return statement!! Functions return by default the last evaluated expression
  #   head
  # end


  def first([head| _], val), do: head


  # If length zero do nil otherwise it will run the second one. This condition is a guard clause, it is basically another way to do
  # pattern matching.
  # By adding a default to this function, If I put this before the other one with the head I get an error. Elixir does not know how to behave with
  # pattern matching. When I pass a single parameter it doesnt know if it should return the head of the val
  def first([], val \\ nil) when length(list) == 0, do: val

  def add(list, val \\ 0) do # \\ 0 means that if val is missing, I'll default to 0
      [val | list]
  end

end

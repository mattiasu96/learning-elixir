defmodule Sample.Utils do
  def square(a), do: a*a

  def sum(a,b), do: a+b

  def custom_func(a,f) do
    f.(a) # This way I call the function f on the variable a, Im passing a function to a function
  end

end

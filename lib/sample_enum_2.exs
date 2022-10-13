defmodule Sample.Enum do


  def first(list, val \\ nil)
  def first([head| _], _), do: head
  def first([], val), do: val

  def square(number) do
    number**2
  end

  def add(list, val \\ 0) do #
      trace(val)
      [val | list]
  end

  defp trace(string) do # declares private function
      IO.puts("The value passed in was #{string}")

  end

end

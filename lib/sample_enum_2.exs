defmodule Sample.Enum do


  def first(list, val \\ nil)
  def first([head| _], _), do: head
  def first([], val) when length(list) == 0, do: val

  def add(list, val \\ 0) do #
      [val | list]
  end

end

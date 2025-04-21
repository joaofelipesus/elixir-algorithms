defmodule Search.BiggerNumber do
  def call([]), do: nil

  def call([element]), do: element

  def call(list) do
    Enum.reduce(list, Enum.at(list, 0), fn current_element, acc ->
      case current_element > acc do
        true ->
          current_element

        false ->
          acc
      end
    end)
  end
end

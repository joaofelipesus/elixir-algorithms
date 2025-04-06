defmodule Search.Bynary do
  # handle empty list
  def search([], _), do: nil

  def search([final_element], target_element) do
    if final_element == target_element do
      target_element
    else
      nil
    end
  end


  # add stop condition
  def search(list, target_value) do
    list_size = length(list)
    split_index = floor(list_size / 2)
    compair_element = Enum.at(list, split_index)

    # split nex group
    next_group = if compair_element < target_value do
      Enum.slice(list, split_index, list_size - 1)
    else
      Enum.slice(list, 0, split_index + 1)
    end

    IO.puts "-------------------------------------------"
    IO.puts "split_index: #{split_index}"
    IO.puts "compair_element: #{compair_element}"
    IO.puts "list:"
    IO.inspect list
    IO.puts "next_group:"
    IO.inspect next_group
    IO.puts "target_element: #{target_value}"
    IO.puts "------------------------------------------\n\n\n\n"

    search(next_group, target_value)
  end
end

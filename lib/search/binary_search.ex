defmodule Search.Binary do
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
  def search(list, target_value, i \\ 0) do
    list_size = length(list)
    split_index = floor(list_size / 2)

    # if rem(list_size, 2) > 0 do
    #   split_index = split_index + 1
    # end

    # split_index = calc_split_index(list_size)

    # IO.puts(split_index)
    # IO.puts(rem(list_size, 2))

    compair_element = Enum.at(list, split_index)

    # split nex group
    next_group = if compair_element > target_value do
      Enum.slice(list, split_index, list_size)
    else
      Enum.slice(list, 0, split_index)
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

    if i < 2 do
      search(next_group, target_value, i + 1)
    end
  end

  # defp calc_split_index(list_size) when rem(list_size, 2) > 0 do
  #   floor(list_size / 2)
  # end

  # defp calc_split_index(list_size), do: list_size / 2

  # next_group = if compair_element > target_value do
  #   Enum.slice(list, split_index, list_size)
  # else
  #   Enum.slice(list, 0, split_index)
  # end

  # contieu by split list, move logic here
  # defp split_nex_group(list, split_index, compair_element, target_element)
  #   when compair_element > target_elememt do

  # end
end

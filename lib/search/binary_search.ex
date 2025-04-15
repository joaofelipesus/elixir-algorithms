defmodule Search.Binary do
  # handle empty list
  def search([], _), do: nil

  def search(list, target_value) do
    initial_index = 0
    final_index = length(list)
    split_index = floor(final_index / 2)
    current_element = Enum.at(list, split_index)

    search(list, target_value, initial_index, final_index, split_index, current_element)
  end

  # when current element matches with the target element.
  defp search(_list, target_value, _initial_index, _final_index, split_index, current_element)
       when current_element == target_value do
    split_index
  end

  # break condition, when there is only one element to match
  defp search(_list, target_value, initial_index, final_index, split_index, current_element)
       when initial_index + 1 >= final_index do
    case current_element == target_value do
      true -> split_index
      false -> nil
    end
  end

  # when current element is bigger than target_element.
  defp search(list, target_value, initial_index, _final_index, split_index, current_element)
       when current_element > target_value do
    final_index = split_index

    {split_index, current_element} = calc_split_index_and_fetch_element(list, initial_index, final_index)

    search(list, target_value, initial_index, final_index, split_index, current_element)
  end

  # when current element is bigger than target_element.
  defp search(list, target_value, _initial_index, final_index, split_index, current_element)
       when current_element < target_value do
    initial_index = split_index

    {split_index, current_element} = calc_split_index_and_fetch_element(list, initial_index, final_index)

    search(list, target_value, initial_index, final_index, split_index, current_element)
  end

  defp calc_split_index_and_fetch_element(list, initial_index, final_index) do
    split_index = floor((final_index - initial_index) / 2) + initial_index
    current_element = Enum.at(list, split_index)

    {split_index, current_element}
  end
end

defmodule Search.Binary do
  # handle empty list
  def search([], _), do: nil

  # stop condition, when final element is equal to the target element
  def search([final_element], target_element) when final_element == target_element,
    do: final_element

  # stop condition, when final element is different of the target element
  def search([final_element], target_element) when final_element != target_element,
    do: nil

  def search(list, target_value) do
    list_size = length(list)
    split_index = round(list_size / 2)
    compair_element = Enum.at(list, split_index)

    next_group = split_next_group(list, compair_element, target_value)

    search(next_group, target_value)
  end

  # when compair element is the target element then stop the loop.
  defp split_next_group(_list, compair_element, target_element)
       when compair_element == target_element do
    [compair_element]
  end

  # when compair number is bigger than target_element.
  defp split_next_group(list, compair_element, target_element)
       when target_element > compair_element do
    list_size = length(list)
    split_index = round(list_size / 2)

    case rem(length(list), 2) do
      0 -> Enum.slice(list, split_index - 1, length(list) - 1)
      _ -> Enum.slice(list, split_index, length(list) - 1)
    end
  end

  # when compair number is smaller than target_element.
  defp split_next_group(list, compair_element, target_element)
       when target_element < compair_element do
    list_size = length(list)
    split_index = round(list_size / 2)

    case rem(length(list), 2) do
      0 -> Enum.slice(list, 0, split_index - 1)
      _ -> Enum.slice(list, 0, split_index)
    end
  end
end

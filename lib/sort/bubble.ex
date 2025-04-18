defmodule Sort.Bubble do
  def sort(list) when list == [], do: []

  def sort([element] = list) when length(list) == 1, do: [element]

  def sort(list) do
    iterations = Enum.to_list(0..length(list))

    Enum.reduce(iterations, list, fn iteration, list ->
      until_index = length(list) - iteration
      sort_element(list, 0, until_index)
    end)
  end

  # break loop contition
  defp sort_element(list, current_index, until_index) when current_index == until_index, do: list

  # use untill index
  defp sort_element(list, current_index, until_index) do
    current_element = Enum.at(list, current_index)
    next_element = Enum.at(list, current_index + 1)

    case current_element > next_element do
      true ->
        List.replace_at(list, current_index, next_element)
        |> List.replace_at(current_index + 1, current_element)
        |> sort_element(current_index + 1, until_index)

      false ->
        sort_element(list, current_index + 1, until_index)
    end
  end
end

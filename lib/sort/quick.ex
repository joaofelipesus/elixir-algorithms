defmodule Sort.Quick do
  def sort(list) when list == [], do: []

  def sort(list) when length(list) == 1, do: list

  def sort(list) do
    pivot = Enum.at(list, 0)

    partitions =
      Enum.reduce(list, %{bigger: [], smaller: [], equal: []}, fn element, acc ->
        case element > pivot do
          true ->
            Map.put(acc, :bigger, acc[:bigger] ++ [element])

          false ->
            # handle case when element is equal to the pivot number.
            case element == pivot do
              true ->
                Map.put(acc, :equal, acc[:equal] ++ [element])

              false ->
                Map.put(acc, :smaller, acc[:smaller] ++ [element])
            end
        end
      end)

    sort(partitions[:smaller]) ++ partitions[:equal] ++ sort(partitions[:bigger])
  end
end

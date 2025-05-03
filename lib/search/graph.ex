defmodule Search.Graph do
  defmodule Vertex do
    defstruct [:id, :connections, :value]
  end

  def breadth_first_search(graph, _) when graph == %{}, do: nil


  # TODO: make recursive
  # TODO: add examples with more levels
  # TODO: add examples with duplicated vertexes.
  def breadth_first_search(graph, search_value) do
    levels = Map.keys(graph)
      |> Enum.sort()

    Enum.reduce_while(levels, Enum.at(levels, 0), fn current_level, acc ->
      items = graph[current_level]

      search_result = Enum.reduce_while(items, nil, fn item, _ ->
        if item.value == search_value do
          {:halt, item}
        else
          {:cont, nil}
        end
      end)

      case search_result do
        %Vertex{} -> {:halt, %{level: current_level, vertex: search_result}}
        _ -> {:cont, acc + 1}
      end
    end)
  end
end

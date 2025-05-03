defmodule Search.GraphTest do
  use ExUnit.Case

  alias Search.Graph
  alias Search.Graph.Vertex

  test "breadth_first_search/2 returns nil when the graph is empty" do
    result = Graph.breadth_first_search(%{}, "a_value")

    assert result == nil
  end

  test "breadth_first_search/2 returns a hash with the level and the item when it exists and is on first level" do
    items = [
      %Vertex{id: 1, connections: [], value: "a"},
      %Vertex{id: 2, connections: [], value: "b"},
      %Vertex{id: 3, connections: [], value: "c"}
    ]

    result = Graph.breadth_first_search(%{ 1 => items }, "b")

    assert result == %{level: 1, vertex: %Vertex{id: 2, connections: [], value: "b"}}
  end
end

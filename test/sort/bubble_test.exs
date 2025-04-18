defmodule Sort.BubbleTest do
  use ExUnit.Case

  alias Sort.Bubble

  test "return a empty list, when receive an empty list" do
    list = []

    result = Bubble.sort(list)

    assert result == []
  end

  test "return the received list, when it has only one element" do
    list = [42]

    result = Bubble.sort(list)

    assert result == [42]
  end

  test "return sorted elements, when elements are random" do
    list = [4, 2, 1, 3, 5]

    result = Bubble.sort(list)

    assert result == [1, 2, 3, 4, 5]
  end

  test "return sorted elements, when elements are inverted" do
    list = [5, 4, 3, 2, 1]

    result = Bubble.sort(list)

    assert result == [1, 2, 3, 4, 5]
  end

  test "return sorted elements, when elements are already sorted" do
    list = [1, 2, 3, 4, 5]

    result = Bubble.sort(list)

    assert result == [1, 2, 3, 4, 5]
  end
end

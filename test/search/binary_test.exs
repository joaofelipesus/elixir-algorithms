defmodule Search.BinaryTest do
  use ExUnit.Case

  test "when element exists in the list, it returns the element" do
    list = [1, 2, 3, 4, 5, 6, 7]

    result = Search.Binary.search(list, 4)

    assert result == 4
  end

  test "when element don't exist in the list, it return nil" do
    list = [1, 2, 3, 4, 5, 6, 7]

    result = Search.Binary.search(list, 8)

    assert result, nil
  end

  test "when element is a String, it returns the element" do
    list = ["a", "b", "c", "d"]

    result = Search.Binary.search(list, "c")

    assert result, "c"
  end

  test "when element is duplicated, it returns the element" do
    list = [1, 2, 3, 3, 3, 4, 5, 6, 7]

    result = Search.Binary.search(list, 3)

    assert result, 3
  end

  test "when receive an empty list, return nil" do
    list = []

    result = Search.Binary.search(list, 3)

    assert result, nil
  end
end

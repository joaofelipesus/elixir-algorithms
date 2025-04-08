defmodule Search.BinaryTest do
  use ExUnit.Case

  alias Search.Binary

  test "when element exists in the list, it returns the element" do
    list = [1, 2, 3, 4, 5, 6, 7]

    result = Binary.search(list, 4)

    assert result == 4
  end

  test "when element don't exist in the list, it return nil" do
    list = [1, 2, 3, 4, 5, 6, 7]

    result = Binary.search(list, 8)

    assert result == nil
  end

  test "when element is a String, it returns the element" do
    list = ["a", "b", "c", "d"]

    result = Binary.search(list, "c")

    assert result == "c"
  end

  test "when element is duplicated, it returns the element" do
    list = [1, 2, 3, 3, 3, 4, 5, 6, 7]

    result = Binary.search(list, 3)

    assert result == 3
  end

  test "when receive an empty list, return nil" do
    list = []

    result = Binary.search(list, 3)

    assert result == nil
  end

  test "when the list has a big number of elements and the element exists, it returns the element value" do
    list = Enum.to_list(0..100)

    result = Binary.search(list, 42)

    assert result == 42
  end

  test "when the list has a big number of elements and the element dont exists, it returns nil" do
    list = Enum.to_list(0..100)

    result = Binary.search(list, 120)

    assert result == nil
  end
end

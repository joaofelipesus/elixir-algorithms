defmodule Sort.QuickTest do
  use ExUnit.Case

  alias Sort.Quick

  test "return and empty list when receive a empty list" do
    list = []

    result = Quick.sort(list)

    assert result == []
  end

  test "return the same list, when received list has only one element" do
    list = [42]

    result = Quick.sort(list)

    assert result == [42]
  end

  test "when receive an even size list" do
    list = [3, 2, 5, 4, 1]

    result = Quick.sort(list)

    assert result == [1, 2, 3, 4, 5]
  end

  test "when receive an odd size list" do
    list = [3, 6, 2, 5, 4, 1]

    result = Quick.sort(list)

    assert result == [1, 2, 3, 4, 5, 6]
  end

  test "when the list are already sorted" do
    list = [1, 2, 3, 4, 5]

    result = Quick.sort(list)

    assert result == [1, 2, 3, 4, 5]
  end

  test "when the list are inverted" do
    list = [6, 5, 4, 3, 2, 1]

    result = Quick.sort(list)

    assert result == [1, 2, 3, 4, 5, 6]
  end

  test "when the list has duplicated values" do
    list = [6, 5, 4, 4, 4, 2, 1, 3, 2, 1]

    result = Quick.sort(list)

    assert result == [1, 1, 2, 2, 3, 4, 4, 4, 5, 6]
  end
end

defmodule Search.BiggerNumberTest do
  use ExUnit.Case

  alias Search.BiggerNumber

  test "return nil, when the received list is empty" do
    list = []

    result = BiggerNumber.call(list)

    assert result == nil
  end

  test "return the first element, when the list has only one value" do
    list = [42]

    result = BiggerNumber.call(list)

    assert result == 42
  end

  test "return the correct value, when the first element is the bigger one" do
    list = [42, 3, 2]

    result = BiggerNumber.call(list)

    assert result == 42
  end

  test "return the correct value, when the last element is the bigger one" do
    list = [42, 3, 102]

    result = BiggerNumber.call(list)

    assert result == 102
  end

  test "return the correct value, when the bigger element isn't the first neighter the last" do
    list = [12, 33, 2]

    result = BiggerNumber.call(list)

    assert result == 33
  end
end

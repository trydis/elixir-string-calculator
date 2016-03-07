defmodule StringCalculatorTest do
  use ExUnit.Case
  doctest StringCalculator

  test "empty string returns 0" do
    assert StringCalculator.add("") == 0
  end

  test "handles one number" do
    assert StringCalculator.add("1") == 1
  end

  test "handles two numbers" do
    assert StringCalculator.add("1,2") == 3
  end

  test "handles more than two numbers" do
    assert StringCalculator.add("1,2,3,4,5") == 15
  end

  test "handles newlines between numbers" do
    assert StringCalculator.add("1\n2,3") == 6
  end

  test "handles custom delimiters" do
    assert StringCalculator.add("//;\n1;2") == 3
  end

  test "throws error when passed negative numbers" do
    assert_raise ArgumentError, "-1, -3", fn ->
      StringCalculator.add("-1,2,-3")
    end
  end
end

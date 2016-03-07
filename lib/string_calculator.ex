defmodule StringCalculator do
  def add(""), do: 0

  def add("//" <> rest) do
    [delimiter, numbers] = String.split(rest, "\n")
    add(numbers, [delimiter])
  end

  def add(numbers) do
    add(numbers, [",", "\n"])
  end

  defp add(numbers, delimiters) do
    numbers
    |> String.split(delimiters)
    |> Enum.map(&String.to_integer(&1))
    |> check_for_negatives
    |> Enum.reduce(0, &(&1 + &2))
  end

  defp check_for_negatives(numbers) do
    negatives = Enum.filter(numbers, &(&1 < 0))
    if length(negatives) > 0, do: raise ArgumentError, message: Enum.join(negatives, ", ")
    numbers
  end
end

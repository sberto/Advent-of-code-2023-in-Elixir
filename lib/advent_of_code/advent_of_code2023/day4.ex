defmodule AdventOfCode2023.Day4 do
  use AdventOfCode2023.AdventDay.Stream

  ##################
  def part1(stream) do
    stream
    |> Stream.map(&parse_line/1)
    |> Stream.map(&calculate_points/1)
    |> Enum.sum()
  end

  def parse_line(line) do
    line
    Regex.run(~r/Card\s+\d+: ([\d+ +]+) \| ([\d+ +]+)$/, line, capture: :all_but_first)
    |> Enum.map(&String.split(&1, " ", trim: true))
  end

  def calculate_points([winning_numbers, my_numbers]) do
    for number <- my_numbers do
      if Enum.member?(winning_numbers, number) do
        String.to_integer(number)
      else
        nil
      end
    end
    |> Enum.filter(&(&1 != nil))
    |> length()
    |> pow()
  end

  def pow(0), do: 0
  def pow(exponent) do
    :math.pow(2, exponent - 1)
    |> round()
  end

  ##################
  def part2(stream) do
    stream
  end
end

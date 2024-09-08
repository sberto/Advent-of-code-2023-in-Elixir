defmodule AdventOfCode2023.Day1 do
  use AdventOfCode2023.AdventDay

  ##################
  def part1(list) when is_list(list) do
    list
    |> Enum.map(&part1_line/1)
    |> Enum.sum()
  end

  def part1(stream) do
    stream |> Enum.to_list() |> part1()
  end

  def part1_line(line) do
    digits =
      line
      |> String.split("", trim: true)
      |> Enum.filter(&String.match?(&1, ~r/\d/))
      |> Enum.map(&String.to_integer/1)

    hd(digits) * 10 + Enum.at(digits, -1)
  end

  ##################
  def part2(list) when is_list(list) do
    list
    |> Enum.map(&part2_line/1)
    |> Enum.sum()
  end

  def part2(stream) do
    stream |> Enum.to_list() |> part2()
  end

  @regex ~r/\d|one|two|three|four|five|six|seven|eight|nine/
  @reverse_regex ~r/\d|enin|thgie|neves|xis|evif|ruof|eerht|owt|eno/

  def part2_line(line) do
    first_digit =
      Regex.run(@regex, line)
      |> hd
      |> convert_word_to_digit()

    last_digit =
      Regex.run(@reverse_regex, String.reverse(line))
      |> hd
      |> String.reverse()
      |> convert_word_to_digit()

    first_digit * 10 + last_digit
  end

  def convert_word_to_digit("one"), do: 1
  def convert_word_to_digit("two"), do: 2
  def convert_word_to_digit("three"), do: 3
  def convert_word_to_digit("four"), do: 4
  def convert_word_to_digit("five"), do: 5
  def convert_word_to_digit("six"), do: 6
  def convert_word_to_digit("seven"), do: 7
  def convert_word_to_digit("eight"), do: 8
  def convert_word_to_digit("nine"), do: 9
  def convert_word_to_digit(digit), do: String.to_integer(digit)
end

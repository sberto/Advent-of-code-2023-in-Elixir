defmodule AdventOfCode2023Test.Day1 do
  use ExUnit.Case

  @day_1_input ["1abc2", "pqr3stu8vwx", "a1b2c3d4e5f", "treb7uchet"]
  @day_1_line_output [12, 38, 15, 77]
  @day_1_output 142

  test "day 1 - part 1 - single lines" do
    for {line, expected_line} <- List.zip([@day_1_input, @day_1_line_output]) do
      assert AdventOfCode2023.Day1.part1_line(line) == expected_line
    end
  end

  test "day 1 - part 1 - total" do
    assert AdventOfCode2023.Day1.part1(@day_1_input) == @day_1_output
  end

  ##################

  @day_2_input ["two1nine", "eightwothree", "abcone2threexyz", "xtwone3four", "4nineeightseven2", "zoneight234", "7pqrstsixteen"]
  @day_2_output [29, 83, 13, 24, 42, 14, 76]
  @day_2_output_total 281

  test "day 1 - part 2 - single lines" do
    for {line, expected_line} <- List.zip([@day_2_input, @day_2_output]) do
      assert AdventOfCode2023.Day1.part2_line(line) == expected_line
    end
  end

  test "day 1 - part 2 - total" do
    assert AdventOfCode2023.Day1.part2(@day_2_input) == @day_2_output_total
  end

  test "day 1 - part 2 - overlapping" do
    assert AdventOfCode2023.Day1.part2(["3onefqltjzdrfourcpkfhceightwomc"]) == 32
  end
end
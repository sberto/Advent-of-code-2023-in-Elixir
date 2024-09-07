defmodule AdventOfCode2023Test.Day1 do
  @day_1_input ["1abc2", "pqr3stu8vwx", "a1b2c3d4e5f", "treb7uchet"]
  @day_1_line_output [12, 38, 15, 77]
  @day_1_output 142

  @day_2_input ["two1nine", "eightwothree", "abcone2threexyz", "xtwone3four", "4nineeightseven2", "zoneight234", "7pqrstsixteen"]
  @day_2_output [29, 83, 13, 24, 42, 14, 76]
  @day_2_output_total 281

  use LineByLineTestTemplate

  test "day 1 - part 2 - overlapping" do
    assert AdventOfCode2023.Day1.part2(["3onefqltjzdrfourcpkfhceightwomc"]) == 32
  end
end
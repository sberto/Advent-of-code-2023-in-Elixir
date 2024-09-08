defmodule AdventOfCode2023Test.Day2 do
  use ExUnit.Case

  @day_1_input [
    "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green",
    "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue",
    "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red",
    "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red",
    "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"
  ]
  @day_1_line_output [
    {1, [%{:blue => 3, :red => 4}, %{:red => 1, :green => 2, :blue => 6}, %{:green => 2}]},
    {2,
     [
       %{:blue => 1, :green => 2},
       %{:green => 3, :blue => 4, :red => 1},
       %{:green => 1, :blue => 1}
     ]},
    {3,
     [
       %{:green => 8, :blue => 6, :red => 20},
       %{:blue => 5, :red => 4, :green => 13},
       %{:green => 5, :red => 1}
     ]},
    {4,
     [
       %{:green => 1, :red => 3, :blue => 6},
       %{:green => 3, :red => 6},
       %{:green => 3, :blue => 15, :red => 14}
     ]},
    {5, [%{:red => 6, :blue => 1, :green => 3}, %{:blue => 2, :red => 1, :green => 2}]}
  ]
  @day_1_output 8

  @day_2_input @day_1_input
  @day_2_output [
    %{:red => 4, :green => 2, :blue => 6},
    %{:red => 1, :green => 3, :blue => 4},
    %{:red => 20, :green => 13, :blue => 6},
    %{:red => 14, :green => 3, :blue => 15},
    %{:red => 6, :green => 3, :blue => 2}
  ]
  @day_2_output_total 2286

  use LineByLineTestTemplate
end

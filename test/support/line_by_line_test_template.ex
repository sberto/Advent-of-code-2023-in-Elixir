defmodule LineByLineTestTemplate do
  use ExUnit.CaseTemplate

  using do
    quote do
      @day :erlang.atom_to_binary(__MODULE__, :utf8)
           |> String.split("Day")
           |> List.last()
           |> String.to_integer()
      @module Module.concat(AdventOfCode2023, "Day#{@day}")

      use ExUnit.Case

      test "day #{@day} - part 1 - single lines" do
        for {line, expected_line} <- List.zip([@day_1_input, @day_1_line_output]) do
          assert apply(@module, :part1_line, [line]) == expected_line
        end
      end

      test "day #{@day} - part 1 - total" do
        assert apply(@module, :part1, [@day_1_input]) == @day_1_output
      end

      ##################

      test "day #{@day} - part 2 - single lines" do
        for {line, expected_line} <- List.zip([@day_2_input, @day_2_output]) do
          assert apply(@module, :part2_line, [line]) == expected_line
        end
      end

      test "day #{@day} - part 2 - total" do
        assert apply(@module, :part2, [@day_2_input]) == @day_2_output_total
      end
    end
  end
end

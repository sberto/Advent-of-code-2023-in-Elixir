defmodule StreamTestTemplate do
  use ExUnit.CaseTemplate

  using do
    quote do
      @day :erlang.atom_to_binary(__MODULE__, :utf8)
           |> String.split("Day")
           |> List.last()
           |> String.to_integer()
      @module Module.concat(AdventOfCode2023, "Day#{@day}")

      use ExUnit.Case

      test "day #{@day} - part 1 - total" do
        assert apply(@module, :_part1, [stream(@day_1_input)]) == @day_1_output
      end

      ##################
      test "day #{@day} - part 2 - total" do
        assert apply(@module, :_part2, [stream(@day_2_input)]) == @day_2_output_total
      end

      def stream(string) do
        {:ok, pid} = StringIO.open(string)
        pid |> IO.binstream(:line)
      end
    end
  end
end

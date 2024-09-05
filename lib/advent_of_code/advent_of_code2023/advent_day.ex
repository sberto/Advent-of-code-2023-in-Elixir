defmodule AdventOfCode2023.AdventDay do
  @moduledoc false
  defmacro __using__(_opts) do
    quote do
      def run() do
        IO.puts("Day #{__MODULE__}")
        IO.puts("Part 1: #{part1()}")
        IO.puts("Part 2: #{part2()}")
      end
    end
  end
end

defmodule AdventOfCode2023.AdventDay.LineByLine do
  @moduledoc false
  defmacro __using__(_opts) do
    quote do
      use AdventOfCode2023.AdventDay

      def _part1(%File.Stream{} = stream) do
        stream
        |> Enum.to_list()
        |> Enum.map(&String.trim/1)
        |> part1()
      end

      def _part2(%File.Stream{} = stream) do
        stream
        |> Enum.to_list()
        |> Enum.map(&String.trim/1)
        |> part2()
      end
    end
  end
end

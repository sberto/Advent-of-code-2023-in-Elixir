defmodule AdventOfCode2023.AdventDay.Stream do
  @moduledoc false
  defmacro __using__(_opts) do
    quote do
      use AdventOfCode2023.AdventDay

      def _part1(stream) do
        part1(clean_up(stream))
      end

      def _part2(stream) do
         part2(clean_up(stream))
      end

      defp clean_up(stream) do
        stream
        |> Stream.map(&String.trim/1)
      end
    end
  end
end
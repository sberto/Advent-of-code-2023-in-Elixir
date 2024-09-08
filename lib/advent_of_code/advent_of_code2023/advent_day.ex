defmodule AdventOfCode2023.AdventDay do
  @moduledoc false
  defmacro __using__(_opts) do
    quote do
      @day :erlang.atom_to_binary(__MODULE__, :utf8)
           |> String.split("Day")
           |> List.last()
           |> String.to_integer()

      require Logger

      def run() do
        Logger.info("####################################")
        stream = File.stream!("priv/day_#{@day}.txt")

        common = "[Day #{@day}] "
        info("Sending stream to part1")
        warning("Part 1: #{_part1(stream)}")
        info("Sending stream to part2")
        warning("Part 2: #{_part2(stream)}")
        Logger.info("####################################")
      end

      def debug(string), do: Logger.debug("[Day #{@day}] #{string}")
      def info(string), do: Logger.info("[Day #{@day}] #{string}")
      def warning(string), do: Logger.warning("[Day #{@day}] #{string}")
    end
  end
end

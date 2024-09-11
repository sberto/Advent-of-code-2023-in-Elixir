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
        {time, result} = :timer.tc(fn -> _part1(stream) end)
        warning("Part 1: #{result} in #{time / 1_000} ms")
        info("Sending stream to part2")
        {time, result} = :timer.tc(fn -> _part2(stream) end)
        warning("Part 2: #{result} in #{time / 1_000} ms")
        Logger.info("####################################")
      end

      def debug(string), do: Logger.debug("[Day #{@day}] #{string}")
      def info(string), do: Logger.info("[Day #{@day}] #{string}")
      def warning(string), do: Logger.warning("[Day #{@day}] #{string}")
    end
  end
end

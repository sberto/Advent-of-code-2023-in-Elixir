defmodule AdventOfCode2023 do
  use Application

  @impl true
  def start(_type, _args) do
    IO.puts("Starting Advent of Code 2023")
    setup()
    Mix.env() != :test and run()
    {:ok, self()}
  end

  def setup() do
    unless File.exists?("priv") do
      File.mkdir!("priv")
    end

    for day <- 1..25 do
      unless File.exists?("priv/day_#{day}.txt") do
        session = System.get_env("AOC_SESSION")

        case session do
          nil ->
            IO.puts("AOC_SESSION environment variable is not set")
            throw("AOC_SESSION environment variable is not set")

          _ ->
            {output, 0} =
              System.cmd("curl", [
                "https://adventofcode.com/2023/day/#{day}/input",
                "-H",
                "Cookie: session=#{session}"
              ])

            File.write!("priv/day_#{day}.txt", output)
        end
      end
    end

    IO.puts("All inputs downloaded")
  end

  def run() do
    for day <- 1..25 do
      module = Module.concat(AdventOfCode2023, "Day#{day}")
      apply(module, :run, [])
    end
  end
end

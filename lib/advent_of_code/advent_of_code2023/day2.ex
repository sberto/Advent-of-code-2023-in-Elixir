defmodule AdventOfCode2023.Day2 do
  use AdventOfCode2023.AdventDay.LineByLine

  ##################
  def part1(list) when is_list(list) do
    list
    |> Enum.map(&part1_line/1)
    |> Enum.map(fn {game_number, games} ->
      if check_games(games) do
        game_number
      else
        0
      end
    end)
    |> Enum.sum()
  end

  def part1_line(line) do
    [game_number | games] = line |> String.split([":", ";"], trim: true)
    game_number = game_number |> String.split(" ") |> Enum.take(-1) |> hd |> String.to_integer()
    games = games |> Enum.map(&parse_game/1)
    {game_number, games}
  end

  def parse_game(game) do
    game
    |> String.split([",", " "], trim: true)
    |> Enum.chunk_every(2)
    |> Enum.reduce(
      %{},
      fn [count, color], acc ->
        Map.put(acc, String.to_atom(color), count |> String.to_integer())
      end
    )
  end

  def check_games(games) do
    Enum.all?(
      games,
      &Enum.all?(
        &1,
        fn
          {:red, n} -> n <= 12
          {:green, n} -> n <= 13
          {:blue, n} -> n <= 14
        end
      )
    )
  end

  ##################
  def part2(list) when is_list(list) do
    list
    |> Enum.map(&part2_line/1)
    |> Enum.map(&multiply_games/1)
    |> Enum.sum()
  end

  def part2_line(line) do
    {_, games} = part1_line(line)
    games |> Enum.reduce(&Map.merge(&1, &2, fn _, v1, v2 -> max(v1, v2) end))
  end

  def multiply_games(games) do
    Map.get(games, :red, 0) * Map.get(games, :green, 0) * Map.get(games, :blue, 0)
  end
end

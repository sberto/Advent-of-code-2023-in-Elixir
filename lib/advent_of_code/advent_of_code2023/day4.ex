defmodule AdventOfCode2023.Day4 do
  use AdventOfCode2023.AdventDay.Stream

  ##################
  def part1(stream) do
    stream
    |> Stream.map(&parse_line/1)
    |> Stream.map(&calculate_points/1)
    |> Enum.sum()
  end

  def parse_line(line) do
    Regex.run(~r/Card\s+\d+: ([\d+ +]+) \| ([\d+ +]+)$/, line, capture: :all_but_first)
    |> Enum.map(&String.split(&1, " ", trim: true))
  end

  def calculate_points([winning_numbers, my_numbers]) do
    how_many_matching_numbers?(winning_numbers, my_numbers)
    |> pow()
  end

  def pow(0), do: 0

  def pow(exponent) do
    :math.pow(2, exponent - 1)
    |> round()
  end

  def how_many_matching_numbers?(winning_numbers, my_numbers) do
    Enum.count(my_numbers, &Enum.member?(winning_numbers, &1))
  end

  ##################
  def part2(stream) do
    stream
    |> Stream.map(&parse_line/1)
    |> Stream.with_index(1)
    |> Enum.reduce(%{}, &duplicate_and_count_scs/2)
    |> Map.values()
    |> Enum.sum()
  end

  def duplicate_and_count_scs({[winning_numbers, my_numbers], index}, acc) do
    matching_numbers = how_many_matching_numbers?(winning_numbers, my_numbers)
    acc = Map.update(acc, index, 1, & &1) # add 1 to current index if not present
    current_sc_amount = acc[index] + 1
    cards_to_update = Enum.to_list((index + 1)..(index + matching_numbers)//1)

    List.foldl(
      cards_to_update,
      acc,
      fn card_number, acc ->
        Map.update(acc, card_number, current_sc_amount, &(&1 + current_sc_amount - 1))
      end
    )
  end
end

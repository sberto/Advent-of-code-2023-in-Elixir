defmodule AdventOfCode2023.Day3 do
  use AdventOfCode2023.AdventDay.Stream

  ##################
  def part1(stream) do
    stream
    |> Stream.transform(
      fn -> {nil, nil} end,
      &part1_transform_line/2,
      &part1_transform_last_line/1,
      fn _ -> nil end
    )
    |> Stream.map(fn elem ->
      case List.flatten(elem) |> Enum.filter(&(&1 != nil)) do
        [] -> 0
        numbers -> Enum.sum(numbers)
      end
    end)
    |> Enum.to_list()
    |> Enum.sum()
  end

  def part1_transform_line(after_line, {nil, nil}) do
    {[[nil]], {nil, after_line}}
  end

  def part1_transform_line(after_line, {pre_line, line}) do
    numbers =
      for [{index, length}] <- get_numbers_indexes(line) do
        case has_symbols_around(line, pre_line, after_line, index, length) do
          true -> get_numbers([[{index, length}]], line)
          false -> nil
        end
      end

    {[[numbers]], {line, after_line}}
  end

  def part1_transform_last_line({pre_line, line}) do
    part1_transform_line(nil, {pre_line, line})
  end

  def has_symbols_around(line, nil, after_line, index, length) do
    has_symbols(line, index - 1, 1) or
      has_symbols(line, index + length, 1) or
      has_symbols(after_line, index - 1, length + 2)
  end

  def has_symbols_around(line, pre_line, after_line, index, length) do
    has_symbols(pre_line, index - 1, length + 2) or
      has_symbols_around(line, nil, after_line, index, length)
  end

  def has_symbols(_, -1 = _index, 1 = _length) do
    false
  end

  def has_symbols(nil, _, _) do
    false
  end

  def has_symbols(line, index, length) do
    line_length = String.length(line)

    if index > line_length - 1 do
      false
    else
      {index, length} = fix_index_and_length(line, index, length)
      slice = get_word(line, index, length)
      Regex.match?(~r/[^0-9\.]/, slice)
    end
  end

  def get_word(line, index, length) do
    String.slice(line, index, min(String.length(line), length))
  end

  def fix_index_and_length(line, index, length) do
    line_length = String.length(line)

    if index + length > line_length do
      {index, line_length - index}
    else
      if index < 0 do
        {0, length + index}
      else
        {index, length}
      end
    end
  end

  ##################
  def part2(stream) do
    stream
    |> Stream.transform(
      fn -> {nil, nil} end,
      &part2_transform_line/2,
      &part2_transform_last_line/1,
      fn _ -> nil end
    )
    |> Stream.map(fn elem ->
      case List.flatten(elem) do
        [] -> 0
        numbers -> Enum.sum(numbers)
      end
    end)
    |> Enum.to_list()
    |> Enum.sum()
  end

  ## the idea is to look for every "*" symbols and get the number around
  ## if the numbers are exactly 2, then we multiply them
  ## we then add all the multiplication results
  def part2_transform_line(after_line, {nil, nil}) do
    {[[0]], {nil, after_line}}
  end

  def part2_transform_line(after_line, {pre_line, line}) do
    numbers =
      for [{index, _}] <- Regex.scan(~r/\*/, line, return: :index) do
        case get_numbers_around(line, pre_line, after_line, index) do
          [number1, number2] -> number1 * number2
          _ -> 0
        end
      end

    {[[numbers]], {line, after_line}}
  end

  def part2_transform_last_line({pre_line, line}) do
    part2_transform_line(nil, {pre_line, line})
  end

  def get_numbers_around(line, pre_line, after_line, index) do
    pre_numbers =
      get_numbers_indexes(pre_line)
      |> filter_in([index - 1, index, index + 1])
      |> get_numbers(pre_line)

    numbers =
      get_numbers_indexes(line)
      |> filter_in([index - 1, index + 1])
      |> get_numbers(line)

    after_numbers =
      get_numbers_indexes(after_line)
      |> filter_in([index - 1, index, index + 1])
      |> get_numbers(after_line)

    pre_numbers ++ numbers ++ after_numbers
  end

  def get_numbers_indexes(nil), do: []
  def get_numbers_indexes(line), do: Regex.scan(~r/\d+/, line, return: :index)

  def filter_in(numbers, indexes) do
    Enum.filter(
      numbers,
      fn [{index, length}] ->
        Enum.any?(indexes, fn i -> index <= i and i <= index + length - 1 end)
      end
    )
  end

  def get_numbers(indexes, line) do
    for [{index, length}] <- indexes do
      get_word(line, index, length) |> String.to_integer()
    end
  end
end

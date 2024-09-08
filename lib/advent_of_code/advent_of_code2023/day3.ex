defmodule AdventOfCode2023.Day3 do
  use AdventOfCode2023.AdventDay.Stream

  ##################
  def part1(stream) do
    stream
    |> Stream.transform(
      fn -> {nil, nil} end,
      &transform_line/2,
      &transform_last_line/1,
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

  def transform_line(after_line, {nil, nil}) do
    {[[nil]], {nil, after_line}}
  end

  def transform_line(after_line, {pre_line, line}) do
    numbers =
      for [{index, length}] <- Regex.scan(~r/\d+/, line, return: :index) do
        case has_symbols_around(line, pre_line, after_line, index, length) do
          true ->
            get_word(line, index, length) |> String.to_integer()

          false ->
            nil
        end
      end

    {[[numbers]], {line, after_line}}
  end

  def transform_last_line({pre_line, line}) do
    transform_line(nil, {pre_line, line})
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
  def part2(_stream) do
    throw("Not implemented")
  end
end

defmodule TigerGame.Game.Validator do

  @score_map %{
      0 => 0.1,
      1 => 0.2,
      2 => 0.3,
      3 => 0.4,
      4 => 0.5,
      5 => 0.6
    }

    def matches(board) do
    %{
        score: count_matches(0, board),
        matches: count_matches([], board)
     }
  end

  def count_matches(value, board) do
    value
    |> check_match(fn -> validate_line_1(board) end)
    |> check_match(fn -> validate_line_2(board) end)
    |> check_match(fn -> validate_line_3(board) end)
    |> check_match(fn -> validate_column_1(board) end)
    |> check_match(fn -> validate_column_2(board) end)
    |> check_match(fn -> validate_column_3(board) end)
    |> check_match(fn -> validate_diagonal_1(board) end)
    |> check_match(fn -> validate_diagonal_2(board) end)
  end

  defp check_match(count, func) when is_number(count) do
    result = func.()

    case result  do
       {x, _ponto} -> count + Map.get(@score_map, x, 1)
       false -> count
    end
  end

  defp check_match(count, func) when is_list(count) do
    result = func.()

    case result  do
       {_x, ponto} -> [ponto | count]
       false -> count
    end
  end

  defp validate_line_1([
    [x, x, x],
    [_d, _e, _f],
    [_g, _h, _i]
  ]), do: {x , "line_1"}
  defp validate_line_1(_), do: false

  defp validate_line_2([
    [_a, _b, _c],
    [x, x, x],
    [_g, _h, _i]
  ]), do: {x , "line_2"}
  defp validate_line_2(_), do: false

  defp validate_line_3([
    [_a, _b, _c],
    [_d, _e, _f],
    [x, x, x]
  ]), do: {x , "line_3"}
  defp validate_line_3(_), do: false

  defp validate_column_1([
    [x, _b, _c],
    [x, _e, _f],
    [x, _h, _i]
  ]), do: {x , "column_1"}
  defp validate_column_1(_), do: false

  defp validate_column_2([
    [_a, x, _c],
    [_d, x, _f],
    [_g, x, _i]
  ]), do: {x , "column_2"}
  defp validate_column_2(_), do: false

  defp validate_column_3([
    [_a, _b, x],
    [_d, _e, x],
    [_g, _h, x]
  ]), do: {x , "column_3"}
  defp validate_column_3(_), do: false

  defp validate_diagonal_1([
    [x, _b, _c],
    [_d, x, _f],
    [_g, _h, x]
  ]), do: {x, "diagonal_1"}
  defp validate_diagonal_1(_), do: false

  defp validate_diagonal_2([
    [_a, _b, x],
    [_d, x, _f],
    [x, _h, _i]
  ]), do: {x, "diagonal_2"}
  defp validate_diagonal_2(_), do: false

  def validate([
    [_a, _b, _c],
    [_d, _e, _f],
    [_g, _h, _i]
  ]) do
    false
  end
end

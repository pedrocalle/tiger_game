defmodule TigerGame.Game.Validator do
  def count_matches(board) do
    0
    |> check_match(fn -> validate_1(board) end)
    |> check_match(fn -> validate_2(board) end)
    |> check_match(fn -> validate_3(board) end)
    |> check_match(fn -> validate_4(board) end)
    |> check_match(fn -> validate_5(board) end)
    |> check_match(fn -> validate_6(board) end)
    |> check_match(fn -> validate_7(board) end)
    |> check_match(fn -> validate_8(board) end)
  end

  defp check_match(count, func) do
    cond do
      func.() == true -> count + 1
      func.() == false -> count
    end
  end

  defp validate_1([
    [x, x, x],
    [_d, _e, _f],
    [_g, _h, _i]
  ]), do: {true, x}
  defp validate_1(_), do: false

  defp validate_2([
    [_a, _b, _c],
    [x, x, x],
    [_g, _h, _i]
  ]), do: {true, x}
  defp validate_2(_), do: false

  defp validate_3([
    [_a, _b, _c],
    [_d, _e, _f],
    [x, x, x]
  ]), do: {true, x}
  defp validate_3(_), do: false

  defp validate_4([
    [x, _b, _c],
    [x, _e, _f],
    [x, _h, _i]
  ]), do: {true, x}
  defp validate_4(_), do: false

  defp validate_5([
    [_a, x, _c],
    [_d, x, _f],
    [_g, x, _i]
  ]), do: {true, x}
  defp validate_5(_), do: false

  defp validate_6([
    [_a, _b, x],
    [_d, _e, x],
    [_g, _h, x]
  ]), do: {true, x}
  defp validate_6(_), do: false

  defp validate_7([
    [x, _b, _c],
    [_d, x, _f],
    [_g, _h, x]
  ]), do: {true, x}
  defp validate_7(_), do: false

  defp validate_8([
    [_a, _b, x],
    [_d, x, _f],
    [x, _h, _i]
  ]), do: {true, x}
  defp validate_8(_), do: false

  def validate([
    [_a, _b, _c],
    [_d, _e, _f],
    [_g, _h, _i]
  ]) do
    false
  end
end

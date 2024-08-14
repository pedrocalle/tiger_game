defmodule TigerGame.Game.Game do
  alias TigerGame.Game.Validator
  def generate_game() do
    [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    |> Enum.map(fn line ->
      Enum.map(line, fn _num -> :rand.uniform(9) |> round() end)
    end)
    |>Validator.count_matches()
  end
end

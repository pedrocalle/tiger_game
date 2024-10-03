defmodule TigerGame.Game.Game do
  alias TigerGame.Game.Validator
  def generate_game() do
    [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    |> Enum.map(fn line ->
       line
        Enum.map(line, fn _num -> :rand.uniform(5) |> round() end)
    end)
    |>IO.inspect()
    |>Validator.matches()
  end


  ## se ele ta apostando se nao pontuar nada , ele perde o dinheiro
  def apostar(amount) do
    generate_game()
    |> (fn game_state ->
        score = Map.get(game_state, :score, -1)

        game_state = game_state
        |> Map.put(:amount, amount)
        |> Map.put(:total_received,   score * amount)

        Map.put(game_state , :winner, game_win?(game_state))

      end).()
  end

  def game_win?(%{total_received: total_received} = _game) when total_received > 0, do: true

  def game_win?(_) ,do: false

end

defmodule TigerGame.Repo do
  use Ecto.Repo,
    otp_app: :tiger_game,
    adapter: Ecto.Adapters.Postgres
end

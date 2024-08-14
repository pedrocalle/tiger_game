defmodule TigerGame.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TigerGameWeb.Telemetry,
      TigerGame.Repo,
      {DNSCluster, query: Application.get_env(:tiger_game, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TigerGame.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: TigerGame.Finch},
      # Start a worker by calling: TigerGame.Worker.start_link(arg)
      # {TigerGame.Worker, arg},
      # Start to serve requests, typically the last entry
      TigerGameWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TigerGame.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TigerGameWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

defmodule Default.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Default.Repo,
      # Start the Telemetry supervisor
      DefaultWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Default.PubSub},
      {Websocket.Historical, name: Websocket.Historical},
      {Websocket.Exchanges.Supervisor, name: Websocket.Exchanges.Supervisor},
      # Start the Endpoint (http/https)
      DefaultWeb.Endpoint
      # Start a worker by calling: Default.Worker.start_link(arg)
      # {Default.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Default.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    DefaultWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

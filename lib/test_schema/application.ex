defmodule TestSchema.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      TestSchema.Repo,
      # Start the Telemetry supervisor
      TestSchemaWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: TestSchema.PubSub},
      # Start the Endpoint (http/https)
      TestSchemaWeb.Endpoint
      # Start a worker by calling: TestSchema.Worker.start_link(arg)
      # {TestSchema.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestSchema.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TestSchemaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

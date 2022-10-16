defmodule Tweet.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [ # Here I insert the items undersupervision
      # Starts a worker by calling: Tweet.Worker.start_link(arg)
      # {Tweet.Worker, arg}
      Tweet.Scheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Tweet.Supervisor] # Here I have a strategy for crashing children. If one dies, only that one is gonna be restarted
    Supervisor.start_link(children, opts)
  end
end

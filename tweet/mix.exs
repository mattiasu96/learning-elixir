defmodule Tweet.MixProject do
  use Mix.Project

  def project do
    [
      app: :tweet,
      version: "0.1.0",  # Application version
      elixir: "~> 1.14", # Version of the used elixir
      start_permanent: Mix.env() == :prod, # someting related to prod dev and test. This tells earlang to crash if the supervision tree is shut down
      deps: deps() # dependencies
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger], # list of applications that need to be started to run our current application!
      mod: {Tweet.Application, []} # Name of the main module + list of arguments to pass to our main module
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:quantum, "~> 3.5"},
      {:extwitter, "~> 0.13.1"}

    ]
  end
end

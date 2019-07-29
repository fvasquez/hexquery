defmodule HexQuery.MixProject do
  use Mix.Project

  def project do
    [
      app: :hexquery,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: [main_module: HexQuery]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_cli, "~> 0.1.6"},
      {:httpoison, "~> 1.5.1"},
      {:circuits_i2c, "~> 0.3.4"}
    ]
  end
end

defmodule HexQuery.MixProject do
  use Mix.Project

  def project do
    [
      app: :hexquery,
      version: "0.1.1",
      deps: deps(),
      escript: escript()
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.6.2"},
      {:jason, "~> 1.1.2"}
    ]
  end

  def escript do
    [main_module: HexQuery.CLI]
  end
end

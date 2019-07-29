defmodule HexQuery do
  use ExCLI.DSL, escript: true

  name "hexquery"
  description "Query Hex.pm"
  long_description ~s"""
  A CLI tool for discovering Elixir/Erlang libraries on Hex
  """

  option :verbose, count: true, aliases: [:v]

  command :dependents do
    aliases [:children]
    description "Search for package dependents"
    long_description """
    Lists all the packages in Hex that depend on a given package
    """

    argument :package

    run context do
      IO.puts("TODO: Query Hex.pm for #{context.package} dependents")
    end
  end
end

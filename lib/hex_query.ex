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
    description "List package dependents"
    long_description """
    Lists all the packages in Hex that depend on a given package
    """

    argument :package
    option :containing, help: "a search string"

    run context do
      HexAPI.start
      #url = "/packages?search=depends%3A#{context.package}"
      url = "/packages/#{context.package}"
      response = HexAPI.get!(url)
      if search_string = context[:containing] do
        IO.puts("TODO: Filter #{context.package}'s dependents by #{search_string}")
      end
      IO.puts(response.body[:url])
    end
  end
end

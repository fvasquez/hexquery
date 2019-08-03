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
      HTTPoison.start
      url = "https://hex.pm/api/packages?search=depends%3A#{context.package}"
      case HTTPoison.get(url) do
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
          body
          |> Jason.decode!
          |> Enum.map(fn(obj) -> IO.puts obj["name"] end)
          if search_string = context[:containing] do
            IO.puts "TODO: Filter #{context.package}'s dependents by #{search_string}"
          end
        {:ok, %HTTPoison.Response{status_code: 404}} ->
          IO.puts "Not found :("
        {:error, %HTTPoison.Error{reason: reason}} ->
          IO.inspect reason
      end
    end
  end
end

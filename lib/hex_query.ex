defmodule HexQuery.CLI do
  def main(argv) do
    case OptionParser.parse(argv, switches: [depends: :string, verbose: :boolean]) do
      {[depends: package], [], []} -> depends(package, false)
      {[depends: package, verbose: true], [], []} -> depends(package, true)
      _ -> help()
    end
  end

  def help() do
    IO.puts "Usage: hexquery --depends <package> [--verbose]"
  end

  def depends(package, verbose) do
    HTTPoison.start

    url = "https://hex.pm/api/packages?search=depends%3A#{package}"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Jason.decode!
        |> Enum.map(fn(package) ->
          case verbose do
            false -> IO.puts package["name"]
            true ->
              desc = String.replace(package["meta"]["description"], ~r/\r|\n/, " ")
              IO.puts "#{package["name"]}: #{desc}"
          end
        end)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Error: 404 Not Found"
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end
end

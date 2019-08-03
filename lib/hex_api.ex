defmodule HexAPI do
  use HTTPoison.Base

  @expected_fields ~w(
    docs_html_url downloads all day recent week html_url inserted_at meta
    description licenses links maintainers name releases has_docs url version
    repository retirements updated_at url
  )

  def process_request_url(url) do
    "https://hex.pm/api" <> url
  end

  def process_response_body(body) do
    body
    |> Jason.decode!
    |> Enum.map(fn(obj) -> IO.puts obj["name"] end)
    #body
    #|> Poison.decode!
    #|> Map.take(@expected_fields)
    #|> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
end

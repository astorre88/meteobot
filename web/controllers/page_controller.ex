defmodule Meteobot.PageController do
  use Meteobot.Web, :controller

  def index(conn, params) do
    IO.inspect(params)
    # %{"from" => from, "id" => id, "offset" => _, "query" => query} = params["inline_query"]
    # Qwantclient.search(from["id"], id, query)
    
    case Nadia.send_message(1, 'test') do
      {:ok, _result} ->
        :ok
      {:error, %Nadia.Model.Error{reason: "Please wait a little"}} ->
        :wait
    end
    conn
    |> json %{ status: true }
  end
end

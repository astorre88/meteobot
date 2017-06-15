defmodule Meteobot.PageController do
  use Meteobot.Web, :controller

  def index(conn, params) do
    %{"from" => from, "id" => id, "offset" => _, "query" => query} = params["message"]
    # Qwantclient.search(from["id"], id, query)
    
    case Nadia.send_message(from["id"], 'test') do
      {:ok, _result} ->
        :ok
      {:error, %Nadia.Model.Error{reason: "Please wait a little"}} ->
        :wait
    end
    conn
    |> json %{ status: true }
  end
end

defmodule Meteobot.PageController do
  use Meteobot.Web, :controller

  def index(conn, params) do
    %{"from" => from, "id" => id, "offset" => _, "query" => query} = params["inline_query"]
    Qwantclient.search(from["id"], id, query)
    conn
    |> json %{ status: true }
  end
end

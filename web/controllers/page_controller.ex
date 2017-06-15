defmodule Meteobot.PageController do
  use Meteobot.Web, :controller

  def index(conn, %{"inline_query" => %{"from" => %{"id" => user_id}, "id" => id, "query" => query}}) do
    case query do
      "" -> :ok
      _ -> Qwantclient.search(user_id, id, query)
    end

    conn
    |> json %{ status: true }
  end
end

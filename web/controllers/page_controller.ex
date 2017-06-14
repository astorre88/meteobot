defmodule Meteobot.PageController do
  use Meteobot.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

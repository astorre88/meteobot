defmodule Meteobot.PageController do
  use Meteobot.Web, :controller

  def index(conn, %{"inline_query" => %{"from" => %{"id" => user_id}, "id" => id, "query" => query}}) do
    # %{
    #   "message" => %{
    #     "chat" => %{
    #       "first_name" => "Dmitry",
    #       "id" => 59434273,
    #       "type" => "private",
    #       "username" => "astorre"
    #     },
    #     "date" => 1497531144,
    #     "entities" => [%{"length" => 6, "offset" => 0, "type" => "bot_command"}],
    #     "from" => %{
    #       "first_name" => "Dmitry",
    #       "id" => 59434273,
    #       "language_code" => "ru-RU",
    #       "username" => "astorre"
    #     },
    #     "message_id" => 23,
    #     "text" => "/start"
    #   },
    #   "update_id" => 146402609
    # }

    # %{
    #   "inline_query" => %{
    #     "from" => %{
    #       "first_name" => "Dmitry",
    #       "id" => 59434273,
    #       "language_code" => "ru-RU",
    #       "username" => "astorre"
    #     },
    #     "id" => "255268260391280166",
    #     "offset" => "",
    #     "query" => "faith"
    #   },
    #   "update_id" => 146402644
    # }

    Qwantclient.search(user_id, id, query)

    # case Nadia.send_message(user_id, query) do
    #   {:ok, _result} ->
    #     :ok
    #   {:error, %Nadia.Model.Error{reason: "Please wait a little"}} ->
    #     :wait
    # end

    conn
    |> json %{ status: true }
  end
end

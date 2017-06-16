defmodule Qwantclient do

  def search(_userid, requestId, query) do
    request(query)
    |>Poison.decode!
    |>parser
    |>send_toUser(requestId)
  end

  def request(query) do
    url = "https://api.qwant.com/api/search/web?count=10&device=mobile&extensionDisabled=true&safesearch=1&locale=ru_RU&q=#{URI.encode(query, &URI.char_unreserved?/1)}&t=web"
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts "reason #{inspect reason}"
        reason
    end
  end

  def parser(data) do
    data["data"]["result"]["items"]
    |> Enum.map(fn (item)->
          article = %Nadia.Model.InlineQueryResult.Article{}
          %{article | title: item["title"],
              thumb_url: "http:"<>item["favicon"],
              description: item["desc"],
              url: item["url"],
              id: item["_id"],
              input_message_content: %Nadia.Model.InputMessageContent.Text{ %Nadia.Model.InputMessageContent.Text{} | message_text: item["title"]<>item["desc"], parse_mode: "HTML" }
            } end)
  end

  def send_toUser(response, requestId) do
    Nadia.answer_inline_query(requestId, response)
  end
end

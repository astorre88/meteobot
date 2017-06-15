defmodule Meteobot.Router do
  use Meteobot.Web, :router

  scope "/", Meteobot do
    post "/webhooks/telegram_vbc43edbf3745a07595dpqm4bfab34l1", PageController, :index
  end
end

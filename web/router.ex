defmodule Meteobot.Router do
  use Meteobot.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Meteobot do
    pipe_through :browser # Use the default browser stack

    post "/webhooks/telegram_vbc43edbf3745a07595dpqm4bfab34l1", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Meteobot do
  #   pipe_through :api
  # end
end

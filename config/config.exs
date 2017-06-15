# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :meteobot, Meteobot.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VxQp0uxxkGOPgi2yjUL6ZG2XBcVdPAYfQ25z+COCoGVs6ad/OjQG9V8/Rsq1QdbU",
  render_errors: [view: Meteobot.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Meteobot.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :nadia,
 token: "385233462:AAGR1k7-o4Jnz4tmKVjpttnPX3jjpC2xHs4"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

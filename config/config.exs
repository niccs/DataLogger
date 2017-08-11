# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :dataLogger,
  ecto_repos: [DataLogger.Repo]

# Configures the endpoint
config :dataLogger, DataLoggerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qV9PLIjTEHkE3LGUGtrO6zbDb6bxJnxo3lU85ENhnoxn8W616Sc377xw1OsNmnH1",
  render_errors: [view: DataLoggerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DataLogger.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

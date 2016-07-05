# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :places,
  ecto_repos: [Places.Repo]

# Configures the endpoint
config :places, Places.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bMaruj6MmwM64MeYyNAZwCBdYIl8/1wZi7LLLCRimlSzgsOqr0QhKnYV5221hQz4",
  render_errors: [view: Places.ErrorView, accepts: ~w(json)],
  pubsub: [name: Places.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :format_encoders,
  "json-api": Poison

config :plug, :mimes, %{
  "application/vnd.api+json" => ["json-api"]
}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

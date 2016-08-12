use Mix.Config

config :savor,
  ecto_repos: [Savor.Repo]

config :savor, Savor.Endpoint,
  url: [host: "localhost"],
  secret_key_base: System.get_env("SECRET_KEY_BASE") || "bMaruj6MmwM64MeYyNAZwCBdYIl8/1wZi7LLLCRimlSzgsOqr0QhKnYV5221hQz4",
  render_errors: [view: Savor.ErrorView, accepts: ~w(json)],
  pubsub: [name: Savor.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :format_encoders,
  "json-api": Poison

config :plug, :mimes, %{
  "application/vnd.api+json" => ["json-api"]
}

config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "Savor",
  ttl: {30, :days},
  verify_issuer: true,
  secret_key: System.get_env("GUARDIAN_SECRET") || "SgbeBs8u8QOqfHdjPpB8Vn+sO/hHwZtjo9AUi1LJG9+qUkSr11qnPf4wBLULGTyN",
  serializer: Savor.GuardianSerializer

config :arc,
  bucket: "savorphotos"

config :ex_aws,
  access_key_id: System.get_env("AWS_ACCESS_KEY_ID") || "AKIAJUWFVKGQ7CEPMTXQ",
  secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY") || "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"

import_config "#{Mix.env}.exs"

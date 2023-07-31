import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :pix_transactions_api, PixTransactionsApi.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "pix_transactions_api_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pix_transactions_api, PixTransactionsApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Vz5X6x45wLvqexU+kB1PH1IPrUXsKWAxHOEE3cq4yJc2gsmJ1EUitmdmWgIQ9Zzm",
  server: false

# In test we don't send emails.
config :pix_transactions_api, PixTransactionsApi.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

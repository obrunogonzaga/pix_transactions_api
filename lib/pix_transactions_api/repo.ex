defmodule PixTransactionsApi.Repo do
  use Ecto.Repo,
    otp_app: :pix_transactions_api,
    adapter: Ecto.Adapters.Postgres
end

defmodule PixTransactionsApi.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :chave_pix, :string
      add :valor, :float
      add :data_transacao, :date
      add :descricao, :text

      timestamps()
    end
  end
end

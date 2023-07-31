defmodule PixTransactionsApi.PIX.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transactions" do
    field :chave_pix, :string
    field :valor, :float
    field :data_transacao, :date
    field :descricao, :string

    timestamps()
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:chave_pix, :valor, :data_transacao, :descricao])
    |> validate_required([:chave_pix, :valor, :data_transacao, :descricao])
  end
end

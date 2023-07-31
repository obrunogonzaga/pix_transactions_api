defmodule PixTransactionsApi.PIXFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PixTransactionsApi.PIX` context.
  """

  @doc """
  Generate a transaction.
  """
  def transaction_fixture(attrs \\ %{}) do
    {:ok, transaction} =
      attrs
      |> Enum.into(%{
        chave_pix: "some chave_pix",
        valor: 120.5,
        data_transacao: ~D[2023-07-30],
        descricao: "some descricao"
      })
      |> PixTransactionsApi.PIX.create_transaction()

    transaction
  end
end

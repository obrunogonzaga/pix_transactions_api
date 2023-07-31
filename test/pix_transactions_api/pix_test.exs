defmodule PixTransactionsApi.PIXTest do
  use PixTransactionsApi.DataCase

  alias PixTransactionsApi.PIX

  describe "transactions" do
    alias PixTransactionsApi.PIX.Transaction

    import PixTransactionsApi.PIXFixtures

    @invalid_attrs %{chave_pix: nil, valor: nil, data_transacao: nil, descricao: nil}

    test "list_transactions/0 returns all transactions" do
      transaction = transaction_fixture()
      assert PIX.list_transactions() == [transaction]
    end

    test "get_transaction!/1 returns the transaction with given id" do
      transaction = transaction_fixture()
      assert PIX.get_transaction!(transaction.id) == transaction
    end

    test "create_transaction/1 with valid data creates a transaction" do
      valid_attrs = %{chave_pix: "some chave_pix", valor: 120.5, data_transacao: ~D[2023-07-30], descricao: "some descricao"}

      assert {:ok, %Transaction{} = transaction} = PIX.create_transaction(valid_attrs)
      assert transaction.chave_pix == "some chave_pix"
      assert transaction.valor == 120.5
      assert transaction.data_transacao == ~D[2023-07-30]
      assert transaction.descricao == "some descricao"
    end

    test "create_transaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PIX.create_transaction(@invalid_attrs)
    end

    test "update_transaction/2 with valid data updates the transaction" do
      transaction = transaction_fixture()
      update_attrs = %{chave_pix: "some updated chave_pix", valor: 456.7, data_transacao: ~D[2023-07-31], descricao: "some updated descricao"}

      assert {:ok, %Transaction{} = transaction} = PIX.update_transaction(transaction, update_attrs)
      assert transaction.chave_pix == "some updated chave_pix"
      assert transaction.valor == 456.7
      assert transaction.data_transacao == ~D[2023-07-31]
      assert transaction.descricao == "some updated descricao"
    end

    test "update_transaction/2 with invalid data returns error changeset" do
      transaction = transaction_fixture()
      assert {:error, %Ecto.Changeset{}} = PIX.update_transaction(transaction, @invalid_attrs)
      assert transaction == PIX.get_transaction!(transaction.id)
    end

    test "delete_transaction/1 deletes the transaction" do
      transaction = transaction_fixture()
      assert {:ok, %Transaction{}} = PIX.delete_transaction(transaction)
      assert_raise Ecto.NoResultsError, fn -> PIX.get_transaction!(transaction.id) end
    end

    test "change_transaction/1 returns a transaction changeset" do
      transaction = transaction_fixture()
      assert %Ecto.Changeset{} = PIX.change_transaction(transaction)
    end
  end
end

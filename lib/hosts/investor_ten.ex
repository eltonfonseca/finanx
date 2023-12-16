defmodule Finanx.Hosts.InvestorTen do
  @moduledoc """
  This module represents the investor ten host.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__

  schema "investor_ten" do
    field(:url, :string, default: "https://www.investidor10.com.br")
    field(:actions_path, :string, default: "/acoes/")
    field(:stocks_path, :string, default: "/stocks/")
    field(:type, Ecto.Enum, values: [:stock, :action], default: :action)
  end

  @fields [
    :url,
    :actions_path,
    :stocks_path,
    :type
  ]

  def new(attrs \\ %{}) do
    %InvestorTen{}
    |> cast(attrs, @fields)
    |> apply_action(:insert)
  end
end

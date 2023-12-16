defmodule Finanx do
  @moduledoc """
  Finanx is a crawler for financial data. This use a integration with websites than get financial informations as stocks and funds.

  ## Example:
  You must to use the `Finanx.data/2` function to get the data from a specific stock or fund.
  The first argument is the type of the ticker, the second is the ticker of the stock or fund.

  ```elixir
  %{:ok, data} = Finanx.data(:stock, "AAPL")
  ```

  ## Output:

  ```elixir
    %{
      ticker: "Apple Inc.",
      price_us: 148.56,
      price_br: 900.56,
      variation: 45.56,
      pl: 31.47,
      pvp: 49.56,
      dy: 0.56,
    }
  ```
  """

  alias Finanx.Crawler
  alias Finanx.Hosts.InvestorTen

  def data(_, ticker) when is_nil(ticker) or byte_size(ticker) == 0 do
    {:error, "Ticker is required, ex: \"AAPL\""}
  end

  def data(type, _) when is_nil(type) or not is_atom(type) do
    {:error, "Type is required, ex: :stock"}
  end

  def data(_type, _ticker) do
    {:ok, nil}
  end

  def quotes(type, ticker) do
    with {:ok, host} <- InvestorTen.new(%{type: type}),
         {:ok, data} <- Crawler.quotes(host, ticker) do
      {:ok, data}
    else
      {:error, reason} ->
        {:error, reason}
    end
  end
end

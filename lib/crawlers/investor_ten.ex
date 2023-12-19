defimpl Finanx.Crawler, for: Finanx.Hosts.InvestorTen do
  alias Finanx.Client.Request

  def quotes(host, ticker) do
    case Request.get(host, format_ticker(ticker)) do
      {:ok, html} ->
        {:ok, build_ticker(html)}

      {:error, reason} ->
        {:error, reason}
    end
  end

  defp format_ticker(ticker) do
    ticker_down = String.downcase(ticker)
    "#{ticker_down}/"
  end

  defp build_ticker(html) do
    {:ok, document} = Floki.parse_document(html)

    document
    |> Floki.find(".stockCurrentQuotation")
    |> Floki.find(".real")
    |> Floki.text()
    |> String.trim()
    |> String.replace("R$\n", "")
    |> String.replace(",", ".")
    |> String.to_float()
  end
end

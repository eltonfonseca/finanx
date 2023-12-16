defimpl Finanx.Crawler, for: Finanx.Hosts.InvestorTen do
  def quotes(_host, _ticker) do
    {:ok, nil}
  end
end

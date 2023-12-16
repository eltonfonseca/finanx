defprotocol Finanx.Crawler do
  @fallback_to_any true

  def quotes(type, ticker)
end

defimpl Finanx.Crawler, for: Any do
  def quotes(type, _ticker) do
    raise "Crawler not implemented for #{inspect(type)}"
  end
end

defmodule Finanx.Client.Request do
  @moduledoc """
  Request client for Finanx.
  """

  @doc """
  """

  use Finanx.Client.Base

  alias Req.Response

  def get(host, ticker) do
    full_url(host, ticker)
    |> request()
    |> Req.get()
    |> parse_response()
  end

  defp parse_response(response) do
    case response do
      {:ok, %Response{status: 200, body: body}} ->
        {:ok, body}

      {:ok, %Response{status: 404}} ->
        {:error, "Not found"}

      {:ok, %Response{status: 500}} ->
        {:error, "Internal server error"}

      {:ok, %Response{status: _status, body: reason}} ->
        {:error, reason}

      {:error, _} ->
        {:error, "Unexpected error on request the website"}
    end
  end

  defp full_url(host, ticker) do
    case host.type do
      :stock ->
        "#{host.url}#{host.stocks_path}#{ticker}"

      :action ->
        "#{host.url}#{host.actions_path}#{ticker}"
    end
  end
end

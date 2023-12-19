defmodule Finanx.Client.Base do
  @moduledoc """
  Base client for Finanx.
  """

  @doc """
  This module is a behaviour that defines the client interface.
  """

  @callback get(host :: map(), ticker :: bitstring()) :: {:ok, any()} | {:error, any()}

  defmacro __using__(_) do
    quote do
      @behaviour Finanx.Client.Base

      def request(url) do
        Req.new(
          url: url,
          receive_timeout: 30_000,
          retry: :transient,
          max_retries: 3,
          retry_delay: &(300 * &1)
        )
      end
    end
  end
end

defmodule Finanx.MixProject do
  use Mix.Project

  def project do
    [
      app: :finanx,
      version: "0.1.0",
      authors: ["Elton Fonseca"],
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ecto, "~> 3.11.1"},
      {:floki, "~> 0.35.0"},
      {:httpoison, "~> 2.2.1"}
    ]
  end
end

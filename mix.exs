defmodule Finanx.MixProject do
  use Mix.Project

  def project do
    [
      app: :finanx,
      version: "0.1.0",
      elixir: "~> 1.15",
      authors: ["Elton Fonseca"],
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      name: "Finanx",
      homepage_url: "https://github.com/eltonfonseca/finanx",
      description: """
      Crawler for financial market informations.
      """
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
      {:ex_doc, "~> 0.31", only: :dev, runtime: false},
      {:floki, "~> 0.35.0"},
      {:httpoison, "~> 2.2.1"}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Elton Fonseca"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/eltonfonseca/finanx"}
    ]
  end
end

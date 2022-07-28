defmodule CrmComponents.MixProject do
  use Mix.Project

  @source_url "https://github.com/alexvyber/crm_components"
  @version "0.1.0"

  def project do
    [
      app: :crm_components,
      version: @version,
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix, "~> 1.6"},
      {:phoenix_live_view, "~> 0.17"},
      {:jason, "~> 1.3", only: [:dev, :test]},
      {:ex_doc, "~> 0.28.4", only: :dev, runtime: false},
      {:phoenix_ecto, "~> 4.4"},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false}
      # {:excoveralls, "~> 0.14.6", only: :test}
    ]
  end

  defp description() do
    """
    CRM Components
    """
  end

  defp package do
    [
      maintainers: ["Alex Vyber"],
      licenses: ["DBD"],
      links: %{"GitHub" => @source_url}
    ]
  end
end

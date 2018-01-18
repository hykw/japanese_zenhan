defmodule JapaneseZenhan.Mixfile do
  use Mix.Project

  def project do
    [
      app: :japanese_zenhan,
      version: "1.0.1",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      source_url: "https://github.com/hykw/japanese_zenhan",
      homepage_url: "https://github.com/hykw/japanese_zenhan",
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:credo, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.16.2", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    Elixir Library for converting Japanese characters between Full-width(Zen) and Half-width(Han)

    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Hitoshi Hayakawa"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/hykw/japanese_zenhan"}
    ]
  end
end

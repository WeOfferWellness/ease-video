import Config

if config_env() == :prod do
  host = System.get_env("PHX_HOST") || "lume.weofferwellness.co.uk"
  port = String.to_integer(System.get_env("PORT") || "4000")

  config :lume, LumeWeb.Endpoint,
    # How the outside world reaches you
    url: [host: host, scheme: "https", port: 443],
    # Where the server actually listens (behind Apache)
    http: [ip: {127, 0, 0, 1}, port: port],
    server: true,
    secret_key_base: System.fetch_env!("SECRET_KEY_BASE"),
    force_ssl: [hsts: true],
    # Helpful in reverse-proxy setups
    check_origin: [
      "https://#{host}",
      "https://www.#{host}"
    ]

  # If you use Phoenix static asset digesting in 1.6/1.7:
  # config :lume, LumeWeb.Endpoint, cache_static_manifest: "priv/static/cache_manifest.json"
end


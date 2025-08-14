use Mix.Config

config :simple_wrtc_demo, SimpleWrtcDemoWeb.Endpoint,
  url: [host: "lume.weofferwellness.co.uk", scheme: "https", port: 443],
  # Binding is fine on all interfaces when reverse-proxied
  http: [port: String.to_integer(System.get_env("PORT") || "4000")],
  server: true,
  # Trust the proxy's X-Forwarded-Proto so Plug.SSL knows it's already HTTPS
  force_ssl: [hsts: true, rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/cache_manifest.json"

import_config "prod.secret.exs"


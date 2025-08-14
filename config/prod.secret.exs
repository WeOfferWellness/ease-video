use Mix.Config

config :simple_wrtc_demo, SimpleWrtcDemoWeb.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE")


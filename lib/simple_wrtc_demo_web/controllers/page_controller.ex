defmodule SimpleWrtcDemoWeb.PageController do
  use SimpleWrtcDemoWeb, :controller

  # Landing page (Google-Meet style)
  def index(conn, _params) do
    render(conn, "home.html")
  end
end

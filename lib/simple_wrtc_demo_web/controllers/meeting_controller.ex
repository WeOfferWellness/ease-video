defmodule SimpleWrtcDemoWeb.MeetingController do
  use SimpleWrtcDemoWeb, :controller

  @len 3
  defp gen_code do
    # short, meet-like code groups e.g. "fer-biru-hpf"
    for _ <- 1..@len do
      :crypto.strong_rand_bytes(3) |> Base.url_encode64(padding: false) |> binary_part(0, 3) |> String.downcase()
    end
    |> Enum.join("-")
  end

  def new(conn, _), do: render(conn, "new.html")

  def create(conn, _params) do
    code = gen_code()
    link = Routes.meeting_path(conn, :lobby, code)
    render(conn, "created.html", code: code, link: link)
  end

  def instant(conn, _params) do
    code = gen_code()
    redirect(conn, to: Routes.meeting_path(conn, :lobby, code))
  end

  def join(conn, %{"code" => raw}) do
    code =
      raw
      |> String.trim()
      |> String.replace(~r/^https?:\/\/[^\/]+\/(m|call)\//i, "")
      |> String.replace(~r/[^a-zA-Z0-9\-]/, "")

    redirect(conn, to: Routes.meeting_path(conn, :lobby, code))
  end

  def lobby(conn, %{"code" => code}) do
    full_url = SimpleWrtcDemoWeb.Endpoint.url() <> Routes.meeting_path(conn, :lobby, code)
    render(conn, "lobby.html", code: code, full_url: full_url)
  end

  def start(conn, %{"code" => code}) do
    redirect(conn, to: Routes.meeting_path(conn, :call, code))
  end

  def call(conn, %{"code" => code}) do
    render(conn, "call.html", code: code)
  end
end

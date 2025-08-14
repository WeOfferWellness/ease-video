defmodule SimpleWrtcDemoWeb.Router do
  use SimpleWrtcDemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SimpleWrtcDemoWeb do
    pipe_through :browser

    # Home (landing)
    get  "/",                PageController,    :index

    # “New meeting” options page
    get  "/new",             MeetingController, :new

    # Actions from the options page
    post "/meeting/create",  MeetingController, :create     # create a link for later
    post "/meeting/instant", MeetingController, :instant    # start an instant meeting

    # Join via code or pasted link from the home page
    post "/join",            MeetingController, :join

    # Lobby (pre-join self-view) and transition to call
    get  "/m/:code",         MeetingController, :lobby
    post "/m/:code/start",   MeetingController, :start

    # Actual call UI (your existing WebRTC page moved here)
    get  "/call/:code",      MeetingController, :call
  end

  # scope "/api", SimpleWrtcDemoWeb do
  #   pipe_through :api
  # end
end

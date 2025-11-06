defmodule AshuiWeb.Router do
  use AshuiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {AshuiWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AshuiWeb do
    pipe_through :browser

    live "/", LandingLive, :index
    live "/docs", DocsLive, :index
    live "/docs/:section", DocsLive, :show
    live "/docs/:section/:component", DocsLive, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", AshuiWeb do
  #   pipe_through :api
  # end
end

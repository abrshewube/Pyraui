defmodule PyrauiWeb.Router do
  use PyrauiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PyrauiWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PyrauiWeb do
    pipe_through :browser

    live "/", LandingLive, :index
    live "/docs", DocsLive, :index
    live "/docs/:section", DocsLive, :show
    live "/docs/:section/:component", DocsLive, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", PyrauiWeb do
  #   pipe_through :api
  # end
end

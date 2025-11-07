defmodule PyrauiWeb.PageController do
  use PyrauiWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end

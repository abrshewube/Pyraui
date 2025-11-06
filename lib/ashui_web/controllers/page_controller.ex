defmodule AshuiWeb.PageController do
  use AshuiWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end

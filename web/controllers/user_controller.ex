defmodule Places.UserController do
  use Places.Web, :controller

  alias Places.User
  plug Guardian.Plug.EnsureAuthenticated, handler: Places.AuthErrorHandler

  def current(conn, _) do
    user = conn
    |> Guardian.Plug.current_resource

    conn
    |> render(Places.UserView, "user.json", user: user)
  end
end
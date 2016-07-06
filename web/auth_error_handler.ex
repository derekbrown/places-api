defmodule Places.AuthErrorHandler do
  use Places.Web, :controller

  def unauthenticated(conn, params) do
    conn
    |> put_status(401)
    |> render(Places.ErrorView, "401.json")
  end

  def unauthorized(conn, params) do
    conn
    |> put_status(403)
    |> render(Places.ErrorView, "403.json")
  end
end
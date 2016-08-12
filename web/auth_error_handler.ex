defmodule Savor.AuthErrorHandler do
  use Savor.Web, :controller

  def unauthenticated(conn, params) do
    conn
    |> put_status(401)
    |> render(Savor.ErrorView, "401.json")
  end

  def unauthorized(conn, params) do
    conn
    |> put_status(403)
    |> render(Savor.ErrorView, "403.json")
  end
end
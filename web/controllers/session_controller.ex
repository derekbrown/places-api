defmodule Places.SessionController do
  use Places.Web, :controller

  def index(conn, _params) do
    conn
    |> json (%{status: "Ok"})
  end
end
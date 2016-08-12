defmodule Savor.RegistrationController do
  use Savor.Web, :controller
  alias Savor.User

  def create(conn, %{"data" => %{"type" => "users",
      "attributes" => %{"username" => username,
        "password" => password,
        "password-confirmation" => password_confirmation}}}) do

    changeset = User.changeset %User{}, %{username: username,
      password_confirmation: password_confirmation,
      password: password}

    case Repo.insert changeset do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render(Savor.UserView, "show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Savor.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
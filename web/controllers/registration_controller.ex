defmodule Places.RegistrationController do
  use Places.Web, :controller
  alias Places.User

  def create(conn, %{"data" => %{"type" => "users",
      "attributes" => %{"email" => email,
        "password" => password,
        "password-confirmation" => password_confirmation}}}) do

    changeset = User.changeset %User{}, %{email: email,
      password_confirmation: password_confirmation,
      password: password}

    case Repo.insert changeset do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render(Places.UserView, "index.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Places.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
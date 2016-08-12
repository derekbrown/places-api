defmodule Savor.UserView do
  use Savor.Web, :view
  use JaSerializer.PhoenixView

  attributes [:email]

  # def render("index.json", %{users: users}) do
  #   %{data: render_many(users, Savor.UserView, "user.json")}
  # end

  # def render("index.json", %{user: user}) do
  #   %{data: render_one(user, Savor.UserView, "user.json")}
  # end

  # def render("user.json", %{user: user}) do
  #   %{
  #     "type": "user",
  #     "id": user.id,
  #     "attributes": %{
  #       "email": user.email
  #     }
  #   }
  # end

end
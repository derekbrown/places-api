defmodule Places.UserView do
  use Places.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Places.UserView, "user.json")}
  end

  def render("index.json", %{user: user}) do
    %{data: render_one(user, Places.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      "type": "user",
      "id": user.id,
      "attributes": %{
        "email": user.email
      }
    }
  end

end
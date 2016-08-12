defmodule Savor.UserTest do
  use Savor.ModelCase

  alias Savor.User

  @valid_attrs %{email: "test@savor.com", password: "Passw0rd1", password_confirmation: "Passw0rd1"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end

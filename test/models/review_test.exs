defmodule Savor.ReviewTest do
  use Savor.ModelCase

  alias Savor.Review

  @valid_attrs %{rating: "120.5", text: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Review.changeset(%Review{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Review.changeset(%Review{}, @invalid_attrs)
    refute changeset.valid?
  end
end

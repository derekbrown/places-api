defmodule Savor.PlaceTest do
  use Savor.ModelCase

  alias Savor.Place

  @valid_attrs %{avoid: "some content", category: "some content", cuisine: "some content", highlights: "some content", info: "some content", name: "some content", phone: "some content", price_range: "some content", rating: "120.5", type: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Place.changeset(%Place{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Place.changeset(%Place{}, @invalid_attrs)
    refute changeset.valid?
  end
end

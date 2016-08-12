defmodule Savor.PlaceControllerTest do
  use Savor.ConnCase

  alias Savor.Place
  @valid_attrs %{avoid: "some content", category: "some content", cuisine: "some content", highlights: "some content", info: "some content", name: "some content", phone: "some content", price_range: "some content", rating: "120.5", type: "some content", url: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, place_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    place = Repo.insert! %Place{}
    conn = get conn, place_path(conn, :show, place)
    assert json_response(conn, 200)["data"] == %{"id" => place.id,
      "name" => place.name,
      "phone" => place.phone,
      "url" => place.url,
      "type" => place.type,
      "cuisine" => place.cuisine,
      "rating" => place.rating,
      "category" => place.category,
      "reviews" => place.reviews,
      "photos" => place.photos,
      "price_range" => place.price_range,
      "info" => place.info,
      "highlights" => place.highlights,
      "avoid" => place.avoid,
      "visits" => place.visits}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, place_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, place_path(conn, :create), place: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Place, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, place_path(conn, :create), place: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    place = Repo.insert! %Place{}
    conn = put conn, place_path(conn, :update, place), place: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Place, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    place = Repo.insert! %Place{}
    conn = put conn, place_path(conn, :update, place), place: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    place = Repo.insert! %Place{}
    conn = delete conn, place_path(conn, :delete, place)
    assert response(conn, 204)
    refute Repo.get(Place, place.id)
  end
end

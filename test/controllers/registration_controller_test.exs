defmodule Places.RegistrationControllerTest do
  use Places.ConnCase

  alias Places.User

  @valid_attrs %{
    "email": "test@places.com",
    "password": "Passw0rd1",
    "password-confirmation": "Passw0rd1"
  }

  @invalid_attrs %{}

  setup %{conn: conn} do
    conn = conn
    |> put_req_header("content-type", "application/json")
    |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, registration_path(conn, :create), %{data: %{type: "user",
      attributes: @valid_attrs
    }}
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(User, %{email: @valid_attrs[:email]})
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    assert_error_sent 400, fn ->
      conn = post conn, registration_path(conn, :create), %{data: %{type: "user",
        attributes: @invalid_attrs
      }}
    end
  end

end
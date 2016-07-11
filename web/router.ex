defmodule Places.Router do
  use Places.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  pipeline :api_auth do
    plug :accepts, ["json", "json-api"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
    plug JaSerializer.ContentTypeNegotiation
    plug JaSerializer.Deserializer
  end

  scope "/api", Places do
    pipe_through :api
    post "/register", RegistrationController, :create
    post "/token", SessionController, :create, as: :login
  end

  scope "/api", Places do
    pipe_through :api_auth
    get "/user/current", UserController, :current, as: :current_user
    resources "/users", UserController, only: [:show, :index] do
      get "/rooms", RoomController, :index, as: :rooms
    end
    resources "/rooms", RoomController, except: [:new, :edit]
  end

end

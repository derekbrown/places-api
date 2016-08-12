defmodule Savor.Router do
  use Savor.Web, :router

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

  scope "/api", Savor do
    pipe_through :api
    post "/register", RegistrationController, :create
    post "/token", SessionController, :create, as: :login
  end

  scope "/api", Savor do
    pipe_through :api_auth
    get "/user/current", UserController, :current, as: :current_user
    resources "/users", UserController, only: [:show, :index]
    resources "/places", PlaceController, except: [:new, :edit]
  end

end

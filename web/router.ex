defmodule Places.Router do
  use Places.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Places do
    pipe_through :api
    resources "session", SessionController, only: [:index]
  end
end

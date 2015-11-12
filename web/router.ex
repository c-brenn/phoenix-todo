defmodule CsTodo.Router do
  use CsTodo.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug BasicAuth, use_config: :cs_todo
  end

  scope "/", CsTodo do
    pipe_through :browser # Use the default browser stack

    get "/", TodoController, :index
  end

  scope "/admin", CsTodo do
    pipe_through [ :browser, :auth ]

    get "/new", TodoController, :new
    post "/create", TodoController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", CsTodo do
  #   pipe_through :api
  # end
end

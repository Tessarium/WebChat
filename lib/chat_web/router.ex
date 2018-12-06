defmodule ChatWeb.Router do
  use ChatWeb, :router

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

  scope "/", ChatWeb do
    pipe_through :browser

    get "/", ChatController, :index
    post "/", ChatController, :sess_name
    get "/chat/room", RoomController, :index
    get "/chat/room/new", RoomController, :new
    post "/chat/room/new", RoomController, :create
    get "/chat/room/:id", RoomController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChatWeb do
  #   pipe_through :api
  # end
end

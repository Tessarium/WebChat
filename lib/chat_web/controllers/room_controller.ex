defmodule ChatWeb.RoomController do
  use ChatWeb, :controller
#  alias ChatWeb.Conversation
  alias Chat.Chat.Room
  alias Chat.Repo

  def index(conn, _params) do
    rooms = ChatWeb.Conversation.list_rooms()
    render(conn, "index.html", rooms: rooms)
  end

  def new(conn, _params) do
    changeset = Room.changeset(%Room{}, %{})
    render(conn, "add.html", changeset: changeset)
  end

  def create(conn, %{"room" => room_params}) do
    %Room{}
    |> Room.changeset(room_params)
    |> Repo.insert()
    |> case do
         {:ok, room} ->
           conn
           |> put_flash(:info, "Room created successfully.")
           |> redirect(to: ChatWeb.Router.Helpers.room_path(conn, :index))

         {:error, %Ecto.Changeset{} = changeset} ->
           render(conn, "add.html", changeset: changeset)
       end
  end

  def show(conn, %{"id" => id}) do
    room = Repo.get!(Room, id)
    name = get_session(conn, :name)
    render(conn, "show.html", room: room, name: name)
  end
end

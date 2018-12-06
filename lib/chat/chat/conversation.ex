defmodule ChatWeb.Conversation do
  alias Chat.Repo
  alias Chat.Chat.Room
  alias Chat.Chat.Message
  import Ecto.Query

  def list_rooms do
    Repo.all(Room)
  end

  def get_room(id), do: Repo.get!(Room, id)

  def list_messages(room_id, limit \\ 15) do
    Repo.all(from msg in Message,
             where: msg.room_id == ^room_id,
             order_by: [desc: msg.inserted_at],
             limit: ^limit,
             select: %{content: msg.content})
  end
end

defmodule ChatWeb.RoomChannel do
  use ChatWeb, :channel
  alias Chat.Repo
  alias Chat.Chat.Message

  def join("room:" <> room_id, _params, socket) do
    {
      :ok,
      %{messages: ChatWeb.Conversation.list_messages(room_id)},
      assign(socket, :room_id, room_id)
    }
  end

  def handle_in("message:add", %{"message" => content, "username" => user}, socket) do
    room = ChatWeb.Conversation.get_room(socket.assigns[:room_id])

    case Repo.insert %Message{content: content, username: user, room: room} do
      {:ok, message} ->
        broadcast!(socket, "room:#{room.id}:new_message", %{content: content})
        {:reply, :ok, socket}
      {:error, _reason} ->
        {:reply, :error, socket}
    end
  end
end

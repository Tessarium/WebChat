defmodule ChatWeb.PageControllerTest do
  use ChatWeb.ConnCase

  @params %{
    name: "Test room"
  }

  test "POST /chat/room/new", %{conn: conn} do
    conn = post conn, "/chat/room/new", [room: @params]

    assert redirected_to(conn) == "/chat/room"
    assert get_flash(conn, :info) == "Room created successfully."
    assert get_last_room().name == "Test room"
  end

  defp get_last_room do
    alias Chat.Chat.Room
    alias Chat.Repo
    import Ecto.Query

    Repo.one(from r in Room, order_by: [desc: r.id], limit: 1)
  end
end

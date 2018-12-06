defmodule ChatWeb.ChatController do
  use ChatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def sess_name(conn, %{"name" => name}) do
    conn = put_session(conn, :name, name)
    redirect(conn, to: "/chat/room")
  end
end

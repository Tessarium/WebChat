defmodule Chat.Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias Chat.Chat.Message

  schema "messages" do
    field :content, :string
    field :username, :string
    belongs_to :room, Chat.Chat.Room

    timestamps()
  end

  @doc false
  def changeset(%Message{} = message, attrs) do
    message
    |> cast(attrs, [:content])
    |> validate_required([:content, :username, :room_id])
  end
end

defmodule Chat.Chat.Room do
  use Ecto.Schema
  import Ecto.Changeset
  alias Chat.Chat.Room

  schema "rooms" do
    field :name, :string
    has_many :messages, Chat.Chat.Message

    timestamps()
  end

  @doc false
  def changeset(%Room{} = room, attrs) do
    room
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

defmodule Default.Games.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :month, :string
    field :name, :string
    field :status, :string
    belongs_to :publisher, Default.Publishers.Publisher, foreign_key: :publisher_uuid, references: :uuid

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:name, :month, :platform, :status])
    |> validate_required([:name, :month, :platform, :status])
  end
end

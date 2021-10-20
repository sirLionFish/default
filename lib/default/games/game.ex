defmodule Default.Games.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :month, :string
    field :game, :string
    field :status, :string
    belongs_to :publisher, Default.Publishers.Publisher
    has_many :platform, Default.Platforms.Platform

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:game, :month, :status])
    |> validate_required([:game, :month, :status])
  end
end

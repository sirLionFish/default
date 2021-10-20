defmodule Default.Platforms.Platform do
  use Ecto.Schema
  import Ecto.Changeset

  schema "platforms" do
    field :platform, :string
    belongs_to :game, Default.Games.Game

    timestamps()
  end

  @doc false
  def changeset(platform, attrs) do
    platform
    |> cast(attrs, [:platform])
    |> validate_required([:platform])
  end
end

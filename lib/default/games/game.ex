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
    |> validate_months()
  end

  @all_months ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  def validate_months(changeset) do
    month = get_field(changeset, :month)
    if month in @all_months do
      changeset

    else
      add_error(changeset, :month, "Not a month; check spelling or proper capitalization")
    end
  end
end

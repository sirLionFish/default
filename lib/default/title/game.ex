defmodule Default.Title.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :game, :string
    field :month, :string
    field :status, :string
    belongs_to :publisher, Default.Title.Publisher

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:game, :month, :status])
    |> validate_required([:game, :month, :status])
    |> validate_months()
    |> validate_status()
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

  @game_state ["Released", "Unrelease"]
  def validate_status(changeset) do
    status = get_field(changeset, :status)
    if status in @game_state do
      changeset

    else
      add_error(changeset, :status, "Not a status; check spelling or proper capitalization")
    end
  end
end

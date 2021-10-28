defmodule Default.Publishers.Publisher do
  use Ecto.Schema
  import Ecto.Changeset

  schema "publishers" do
    field :founded, :integer
    field :location, :string
    field :publisher, :string
    has_many :games, Default.Games.Game

    timestamps()
  end

  @doc false
  def changeset(publisher, attrs) do
    publisher
    |> cast(attrs, [:publisher, :location, :founded])
    |> validate_required([:publisher, :location, :founded])
    |> validate_inclusion(:founded, 1900..2021)
    |> unique_constraint(:publisher)
    |> validate_length(:publisher, min: 2)
  end
end

defmodule Default.Title.Publisher do
  use Ecto.Schema
  import Ecto.Changeset

  schema "publishers" do
    field :location, :string
    field :publisher, :string
    field :year, :integer
    has_many :games, Default.Title.Game

    timestamps()
  end

  @doc false
  def changeset(publisher, attrs) do
    publisher
    |> cast(attrs, [:publisher, :location, :year])
    |> validate_required([:publisher, :location, :year])
    |> validate_inclusion(:year, 1900..2021)
    |> validate_length(:publisher, min: 2)
    |> unique_constraint(:publisher)
  end
end

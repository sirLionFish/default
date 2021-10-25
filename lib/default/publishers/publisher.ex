defmodule Default.Publishers.Publisher do
  use Default.Schema
  import Ecto.Changeset

  schema "publishers" do
    field :location, :string
    field :publisher, :string
    field :year, :string
    has_many :games, Default.Games.Game

    timestamps()
  end

  @doc false
  def changeset(publisher, attrs) do
    publisher
    |> cast(attrs, [:publisher, :year, :location, :platform])
    |> validate_required([:publisher, :year, :location, :platform])
  end
end

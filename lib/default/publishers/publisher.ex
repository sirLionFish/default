defmodule Default.Publishers.Publisher do
  use Ecto.Schema
  import Ecto.Changeset

  schema "publishers" do
    field :founded, :string
    field :location, :string
    field :publisher, :string

    timestamps()
  end

  @doc false
  def changeset(publisher, attrs) do
    publisher
    |> cast(attrs, [:publisher, :location, :founded])
    |> validate_required([:publisher, :location, :founded])
  end
end

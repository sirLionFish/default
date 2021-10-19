defmodule Default.Publishers do

  import Ecto.Query, warn: false
  alias Default.Repo

  alias Default.Publishers.Publisher

  def list_publishers do
    Repo.all(Publisher)
  end

  def get_publisher!(id), do: Repo.get!(Publisher, id)

  def new(publisher: publisher, year: year, location: location) do
    %Default.Publishers.Publisher{
      publisher: publisher,
      year: year,
      location: location}
  end

  def create_publisher(attrs \\ %{}) do
    %Publisher{}
    |> Publisher.changeset(attrs)
    |> Repo.insert()
  end

  def update_publisher(%Publisher{} = publisher, attrs) do
    publisher
    |> Publisher.changeset(attrs)
    |> Repo.update()
  end

  def delete_publisher(%Publisher{} = publisher) do
    Repo.delete(publisher)
  end

  def change_publisher(%Publisher{} = publisher, attrs \\ %{}) do
    Publisher.changeset(publisher, attrs)
  end
end

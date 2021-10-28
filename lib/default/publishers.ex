defmodule Default.Publishers do

  import Ecto.Query, warn: false
  alias Default.Repo
  alias Default.Publishers.Publisher

  def list_all do
    Repo.all(Publisher)
  end

  def get(id) do
    pub = Repo.get!(Publisher, id)
    Repo.preload(pub, :games)
  end


  def new(attrs \\ %{}) do
    %Publisher{}
    |> Publisher.changeset(attrs)
    |> Repo.insert()
  end
  def update(%Publisher{} = publisher, attrs) do
    publisher
    |> Publisher.changeset(attrs)
    |> Repo.update()
  end

  def delete(%Publisher{} = publisher) do
    Repo.delete(publisher)
  end

  def change(%Publisher{} = publisher, attrs \\ %{}) do
    Publisher.changeset(publisher, attrs)
  end
end

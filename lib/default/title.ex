defmodule Default.Title do

  import Ecto.Query, warn: false
  alias Default.Repo
  alias Default.Title.{Publisher, Game}

  def list_publishers(params) do
    word = get_in(params, ["query"])
    Publisher
    |> Default.Search.Scope.search_pub(word)
    |> Repo.all()
  end

  def list_publisher_api do
    Publisher
    |> Repo.all()
  end

  def get_publisher(id) do
    Publisher
    |> Repo.get!(id)
    |> Repo.preload(:games)
  end

  def create_publisher(attrs \\ %{}) do
    %Publisher{}
    |> Publisher.changeset(attrs)
    |> Repo.insert()
  end

  def new(attrs \\ %{}) do
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

  def list_games do
    Game
    |> Repo.all()
  end

  def get_game(id), do: Repo.get!(Game, id)

  def create_game(%Publisher{} = publisher, attrs \\ %{}) do
    publisher
    |> Ecto.build_assoc(:games)
    |> Game.changeset(attrs)
    |> Repo.insert()
  end

  def update_game(%Game{} = game, attrs) do
    game
    |> Game.changeset(attrs)
    |> Repo.update()
  end

  def delete_game(%Game{} = game) do
    Repo.delete(game)
  end

  def change_game(%Game{} = game, attrs \\ %{}) do
    Game.changeset(game, attrs)
  end

  def new_game(attrs, id) do
    pub = Repo.get(Publisher, id)
    Ecto.build_assoc(pub, :games, attrs)
    |> Game.changeset(attrs)
    |> Repo.insert()
  end
end

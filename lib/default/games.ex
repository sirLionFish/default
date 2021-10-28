defmodule Default.Games do

  import Ecto.Query, warn: false
  alias Default.Repo

  alias Default.Games.Game
  alias Default.Publishers.Publisher

  def list_games do
    Repo.all(Game)
  end

  def get_game!(id) do
    pub = Repo.get!(Game, id)
    Repo.preload(pub, :games)
  end

  def create(attrs, id) do
    pub = Repo.get(Publisher, id)
    Ecto.build_assoc(pub, :games, attrs)
    |> Game.changeset(attrs)
    |> Repo.insert()
  end

  # def create(%Publisher{} = pub, attrs \\ %{}) do
  #   pub
  #   |> Ecto.build_assoc(:games)
  #   |> Game.changeset(attrs)
  #   |> Repo.insert()
  # end

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
end

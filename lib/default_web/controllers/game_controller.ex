defmodule DefaultWeb.GameController do
  use DefaultWeb, :controller

  alias Default.{Games, Publishers}
  alias Default.Games.Game

  def index(conn, _params) do
    games = Games.list_games()
    render(conn, "index.html", games: games)
  end

  def new(conn, _params) do
    changeset = Games.change_game(%Game{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"game" => game_params, "publisher" => publisher_id}) do
    pub = Publishers.get(publisher_id)
    case Games.create(game_params, pub) do
      {:ok, _game} ->
        conn
        |> put_flash(:info, "game was added.")
        |> redirect(to: Routes.publisher_path(conn, :show, pub))
      {:error, _changeset} ->
        conn
        |> put_flash(:error, "Issue creating game.")
        |> redirect(to: Routes.publisher_path(conn, :show, pub))
    end
  end

    def update(conn, %{"id" => id, "game" => game_params}) do
    game = Games.get_game!(id)

    case Games.update_game(game, game_params) do
      {:ok, game} ->
        conn
        |> put_flash(:info, "Game updated successfully.")
        |> redirect(to: Routes.publisher_game_path(conn, :show, game))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", game: game, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    game = Games.get_game!(id)
    render(conn, "show.html", game: game)
  end

  def edit(conn, %{"id" => id}) do
    game = Games.get_game!(id)
    changeset = Games.change_game(game)
    render(conn, "edit.html", game: game, changeset: changeset)
  end



  def delete(conn, %{"id" => id}) do
    game = Games.get_game!(id)
    {:ok, _game} = Games.delete_game(game)

    conn
    |> put_flash(:info, "Game deleted successfully.")
    |> redirect(to: Routes.publisher_game_path(conn, :index, game))
  end
end

defmodule DefaultWeb.GameController do
  use DefaultWeb, :controller

  alias Default.Title

  def create(conn, %{"publisher_id" => publisher_id, "game" => game_params}) do
    pub = Title.get_publisher(publisher_id)
    case Title.create_game(pub, game_params) do
      {:ok, _comment} ->
        conn
        |> put_flash(:info, "Game created")
        |> redirect(to: Routes.publisher_path(conn, :show, pub))
      {:error, _changeset} ->
        conn
        |> put_flash(:info, "Error occured")
        |> redirect(to: Routes.publisher_path(conn, :show, pub))
    end
  end

  def delete(conn, %{"id" => id}) do
    game = Title.get_game(id)
    {:ok, _game} = Title.delete_game(game)

    conn
    |> put_flash(:info, "game deleted successfully.")
    |> redirect(to: Routes.publisher_path(conn, :index))
  end
end

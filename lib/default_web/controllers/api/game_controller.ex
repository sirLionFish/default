defmodule DefaultWeb.Api.GameController do
  use DefaultWeb, :controller

  import Ecto.Query, only: [where: 3]
  alias Default.Repo
  alias Default.Title.Game

  def index(conn, %{"publisher_id" => publisher_id}) do
    games =
      Game
      |> where([r], r.publisher_id == ^publisher_id)
      |> Repo.all()

    render(conn, "index.json", games: games)
  end
end

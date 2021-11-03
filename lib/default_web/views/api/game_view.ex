defmodule DefaultWeb.Api.GameView do
  use DefaultWeb, :view

  def render("index.json", %{games: games}) do
    %{data: render_many(games, __MODULE__, "game.json")}
  end

  def render("game.json", %{game: game}) do
    %{
      id: game.id,
      name: game.game,
      month: game.month,
      status: game.status
    }
  end
end

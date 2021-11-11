defmodule Default.Search.Scope do
  import Ecto.Query, only: [from: 2]

  def search_pub(query, word) do
    simple_search = "%#{word}%"
    from publisher in query, where: ilike(publisher.publisher, ^simple_search), or_where: ilike(publisher.location, ^simple_search)
  end

  def search_game(query, word) do
    simple_search = "%#{word}%"
    from game in query, where: ilike(game.game, ^simple_search)
  end
end

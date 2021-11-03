defmodule Default.Search.Scope do
  import Ecto.Query, only: [from: 2]

  def search(query, word) do
    search_publisher = "%#{word}%"
    from publisher in query, where: ilike(publisher.publisher, ^search_publisher)
  end
end

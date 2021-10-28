defmodule DefaultWeb.Api.PublisherView do
  use DefaultWeb, :view

  def render("index.json", %{publishers: publishers}) do
    %{data: render_many(publishers, __MODULE__, "publisher.json")}
  end

  def render("publisher.json", %{publisher: publisher}) do
    %{
      id: publisher.id,
      name: publisher.publisher,
      inserted_at: publisher.inserted_at,
      updated_at: publisher.updated_at
    }
  end
end

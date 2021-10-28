defmodule DefaultWeb.Api.PublisherController do
  use DefaultWeb, :controller

  def index(conn, _params) do
    publishers = Default.Publishers.list_all

    render(conn, "index.json", publishers: publishers)
  end
end

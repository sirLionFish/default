defmodule DefaultWeb.Api.PublisherController do
  use DefaultWeb, :controller

  def index(conn, _params) do
    publishers = Default.Title.list_publisher_api
    render(conn, "index.json", publishers: publishers)
  end
end

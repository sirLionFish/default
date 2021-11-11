defmodule DefaultWeb.ProductsController do
  use DefaultWeb, :controller

  def index(conn, _params) do
    trades =
      Websocket.available_products()
      |> Websocket.get_last_trades()
    render(conn, "index.html", trades: trades)
  end
end

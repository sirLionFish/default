
defmodule DefaultWeb.Webapp.BlogHomeController do
  use DefaultWeb, :controller

  def index(conn, _params) do
    send_resp(conn, 200, render_astro())
  end

  defp render_astro() do
    Application.app_dir(:default, "priv/static/webapp/blog/index.html")
    |> File.read!()
  end
end

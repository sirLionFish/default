
defmodule DefaultWeb.Webapp.AboutController do
  use DefaultWeb, :controller

  def index(conn, _params) do
    send_resp(conn, 200, render_astro())
  end

  defp render_astro() do
    Application.app_dir(:default, "priv/static/webapp/about/index.html")
    |> File.read!()
  end
end

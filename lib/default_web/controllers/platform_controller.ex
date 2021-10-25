defmodule DefaultWeb.PlatformController do
  use DefaultWeb, :controller

  alias Default.Platforms
  alias Default.Platforms.Platform

  def index(conn, _params) do
    platforms = Platforms.list_platforms()
    render(conn, "index.html", platforms: platforms)
  end

  def new(conn, _params) do
    changeset = Platforms.change_platform(%Platform{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"platform" => platform_params}) do
    case Platforms.create_platform(platform_params) do
      {:ok, platform} ->
        conn
        |> put_flash(:info, "Platform created successfully.")
        |> redirect(to: Routes.platform_path(conn, :show, platform))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    platform = Platforms.get_platform!(id)
    render(conn, "show.html", platform: platform)
  end

  def edit(conn, %{"id" => id}) do
    platform = Platforms.get_platform!(id)
    changeset = Platforms.change_platform(platform)
    render(conn, "edit.html", platform: platform, changeset: changeset)
  end

  def update(conn, %{"id" => id, "platform" => platform_params}) do
    platform = Platforms.get_platform!(id)

    case Platforms.update_platform(platform, platform_params) do
      {:ok, platform} ->
        conn
        |> put_flash(:info, "Platform updated successfully.")
        |> redirect(to: Routes.platform_path(conn, :show, platform))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", platform: platform, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    platform = Platforms.get_platform!(id)
    {:ok, _platform} = Platforms.delete_platform(platform)

    conn
    |> put_flash(:info, "Platform deleted successfully.")
    |> redirect(to: Routes.platform_path(conn, :index))
  end
end

defmodule DefaultWeb.PublisherController do
  use DefaultWeb, :controller

  alias Default.Title
  alias Default.Title.{Game, Publisher}

  def index(conn, params) do
    publishers = Title.list_publishers(params)
    render(conn, "index.html", publishers: publishers)
  end

  def new(conn, _params) do
    changeset = Title.change_publisher(%Publisher{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"publisher" => publisher_params}) do
    case Title.create_publisher(publisher_params) do
      {:ok, publisher} ->
        conn
        |> put_flash(:info, "Publisher created successfully.")
        |> redirect(to: Routes.publisher_path(conn, :show, publisher))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    publisher = Title.get_publisher(id)
    game_changeset = Title.change_game(%Game{})
    render(conn, "show.html", publisher: publisher, game_changeset: game_changeset)
  end

  def edit(conn, %{"id" => id}) do
    publisher = Title.get_publisher(id)
    changeset = Title.change_publisher(publisher)
    render(conn, "edit.html", publisher: publisher, changeset: changeset)
  end

  def update(conn, %{"id" => id, "publisher" => publisher_params}) do
    publisher = Title.get_publisher(id)

    case Title.update_publisher(publisher, publisher_params) do
      {:ok, publisher} ->
        conn
        |> put_flash(:info, "Publisher updated successfully.")
        |> redirect(to: Routes.publisher_path(conn, :show, publisher))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", publisher: publisher, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    publisher = Title.get_publisher(id)
    {:ok, _publisher} = Title.delete_publisher(publisher)

    conn
    |> put_flash(:info, "Publisher deleted successfully.")
    |> redirect(to: Routes.publisher_path(conn, :index))
  end
end

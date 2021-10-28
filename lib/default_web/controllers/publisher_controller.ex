defmodule DefaultWeb.PublisherController do
  use DefaultWeb, :controller

  alias Default.{Publishers, Games}
  alias Default.Publishers.Publisher
  alias Default.Games.Game

  def index(conn, _params) do
    publishers = Publishers.list_all()
    render(conn, "index.html", publishers: publishers)
  end

  def new(conn, _params) do
    changeset = Publishers.change(%Publisher{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"publisher" => publisher_params}) do
    case Publishers.new(publisher_params) do
      {:ok, publisher} ->
        conn
        |> put_flash(:info, "Publisher created successfully.")
        |> redirect(to: Routes.publisher_path(conn, :show, publisher))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    publisher = Publishers.get(id)
    game_changeset = Games.change_game(%Game{})
    render(conn, "show.html", publisher: publisher, game_changeset: game_changeset)
  end

  def edit(conn, %{"id" => id}) do
    publisher = Publishers.get(id)
    changeset = Publishers.change(publisher)
    render(conn, "edit.html", publisher: publisher, changeset: changeset)
  end

  def update(conn, %{"id" => id, "publisher" => publisher_params}) do
    publisher = Publishers.get(id)

    case Publishers.update(publisher, publisher_params) do
      {:ok, publisher} ->
        conn
        |> put_flash(:info, "Publisher updated successfully.")
        |> redirect(to: Routes.publisher_path(conn, :show, publisher))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", publisher: publisher, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    publisher = Publishers.get(id)
    {:ok, _} = Publishers.delete(publisher)

    conn
    |> put_flash(:info, "Publisher deleted successfully.")
    |> redirect(to: Routes.publisher_path(conn, :index))
  end
end

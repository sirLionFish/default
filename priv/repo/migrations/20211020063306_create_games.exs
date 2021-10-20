defmodule Default.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :name, :string
      add :month, :string
      add :status, :string
      add :publisher_id, references(:publishers, on_delete: :restrict), null: false

      timestamps()
    end

    create index(:rooms, [:publisher_id])
  end
end

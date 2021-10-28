defmodule Default.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :game, :string
      add :month, :string
      add :status, :string
      add :publisher_id, references(:publishers, on_delete: :restrict), null: false

      timestamps()
    end

    create index(:games, [:publisher_id])
  end
end

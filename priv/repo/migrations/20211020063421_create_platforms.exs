defmodule Default.Repo.Migrations.CreatePlatforms do
  use Ecto.Migration

  def change do
    create table(:platforms) do
      add :platform, :string
      add :game_id, references(:games, on_delete: :restrict), null: false

      timestamps()
    end
  end
end

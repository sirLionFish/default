defmodule Default.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games, primary_key: false) do
      add :uuid, :uuid, primary_key: true
      add :name, :string
      add :month, :string
      add :status, :string
      add :uuid, references(:publishers, type: :uuid, column: :uuid)

      timestamps()
    end

  end
end

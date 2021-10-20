defmodule Default.Repo.Migrations.CreatePlatforms do
  use Ecto.Migration

  def change do
    create table(:platforms) do
      add :platform, :string

      timestamps()
    end

  end
end

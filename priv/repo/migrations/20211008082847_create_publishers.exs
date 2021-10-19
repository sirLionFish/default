defmodule Default.Repo.Migrations.CreatePublishers do
  use Ecto.Migration

  def change do
    create table(:publishers, primary_key: false) do
      add :uuid, :uuid, primary_key: true
      add :publisher, :string
      add :year, :string
      add :location, :string

      timestamps()
    end

  end
end

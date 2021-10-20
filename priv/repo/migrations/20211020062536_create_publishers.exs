defmodule Default.Repo.Migrations.CreatePublishers do
  use Ecto.Migration

  def change do
    create table(:publishers) do
      add :publisher, :string
      add :location, :string
      add :founded, :string

      timestamps()
    end

  end
end

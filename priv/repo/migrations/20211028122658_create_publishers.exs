defmodule Default.Repo.Migrations.CreatePublishers do
  use Ecto.Migration

  def change do
    create table(:publishers) do
      add :publisher, :string
      add :year, :integer
      add :location, :string

      timestamps()
    end

  end
end

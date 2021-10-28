defmodule Default.Repo.Migrations.CreatePublishers do
  use Ecto.Migration

  def change do
    create table(:publishers) do
      add :publisher, :string
      add :location, :string
      add :founded, :integer

      timestamps()
    end

  end
end

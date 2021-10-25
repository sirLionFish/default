defmodule Default.Platforms do

  import Ecto.Query, warn: false
  alias Default.Repo

  alias Default.Platforms.Platform

  def list_platforms do
    Repo.all(Platform)
  end

  def get_platform!(id), do: Repo.get!(Platform, id)

  def create_platform(attrs \\ %{}) do
    %Platform{}
    |> Platform.changeset(attrs)
    |> Repo.insert()
  end

  def update_platform(%Platform{} = platform, attrs) do
    platform
    |> Platform.changeset(attrs)
    |> Repo.update()
  end

  def delete_platform(%Platform{} = platform) do
    Repo.delete(platform)
  end

  def change_platform(%Platform{} = platform, attrs \\ %{}) do
    Platform.changeset(platform, attrs)
  end
end

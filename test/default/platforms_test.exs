defmodule Default.PlatformsTest do
  use Default.DataCase

  alias Default.Platforms

  describe "platforms" do
    alias Default.Platforms.Platform

    @valid_attrs %{platform: "some platform"}
    @update_attrs %{platform: "some updated platform"}
    @invalid_attrs %{platform: nil}

    def platform_fixture(attrs \\ %{}) do
      {:ok, platform} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Platforms.create_platform()

      platform
    end

    test "list_platforms/0 returns all platforms" do
      platform = platform_fixture()
      assert Platforms.list_platforms() == [platform]
    end

    test "get_platform!/1 returns the platform with given id" do
      platform = platform_fixture()
      assert Platforms.get_platform!(platform.id) == platform
    end

    test "create_platform/1 with valid data creates a platform" do
      assert {:ok, %Platform{} = platform} = Platforms.create_platform(@valid_attrs)
      assert platform.platform == "some platform"
    end

    test "create_platform/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Platforms.create_platform(@invalid_attrs)
    end

    test "update_platform/2 with valid data updates the platform" do
      platform = platform_fixture()
      assert {:ok, %Platform{} = platform} = Platforms.update_platform(platform, @update_attrs)
      assert platform.platform == "some updated platform"
    end

    test "update_platform/2 with invalid data returns error changeset" do
      platform = platform_fixture()
      assert {:error, %Ecto.Changeset{}} = Platforms.update_platform(platform, @invalid_attrs)
      assert platform == Platforms.get_platform!(platform.id)
    end

    test "delete_platform/1 deletes the platform" do
      platform = platform_fixture()
      assert {:ok, %Platform{}} = Platforms.delete_platform(platform)
      assert_raise Ecto.NoResultsError, fn -> Platforms.get_platform!(platform.id) end
    end

    test "change_platform/1 returns a platform changeset" do
      platform = platform_fixture()
      assert %Ecto.Changeset{} = Platforms.change_platform(platform)
    end
  end
end

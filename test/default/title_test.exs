defmodule Default.TitleTest do
  use Default.DataCase

  alias Default.Title

  describe "publishers" do
    alias Default.Title.Publisher

    @valid_attrs %{location: "some location", publisher: "some publisher", year: 42}
    @update_attrs %{location: "some updated location", publisher: "some updated publisher", year: 43}
    @invalid_attrs %{location: nil, publisher: nil, year: nil}

    def publisher_fixture(attrs \\ %{}) do
      {:ok, publisher} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Title.create_publisher()

      publisher
    end

    test "list_publishers/0 returns all publishers" do
      publisher = publisher_fixture()
      assert Title.list_publishers() == [publisher]
    end

    test "get_publisher!/1 returns the publisher with given id" do
      publisher = publisher_fixture()
      assert Title.get_publisher!(publisher.id) == publisher
    end

    test "create_publisher/1 with valid data creates a publisher" do
      assert {:ok, %Publisher{} = publisher} = Title.create_publisher(@valid_attrs)
      assert publisher.location == "some location"
      assert publisher.publisher == "some publisher"
      assert publisher.year == 42
    end

    test "create_publisher/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Title.create_publisher(@invalid_attrs)
    end

    test "update_publisher/2 with valid data updates the publisher" do
      publisher = publisher_fixture()
      assert {:ok, %Publisher{} = publisher} = Title.update_publisher(publisher, @update_attrs)
      assert publisher.location == "some updated location"
      assert publisher.publisher == "some updated publisher"
      assert publisher.year == 43
    end

    test "update_publisher/2 with invalid data returns error changeset" do
      publisher = publisher_fixture()
      assert {:error, %Ecto.Changeset{}} = Title.update_publisher(publisher, @invalid_attrs)
      assert publisher == Title.get_publisher!(publisher.id)
    end

    test "delete_publisher/1 deletes the publisher" do
      publisher = publisher_fixture()
      assert {:ok, %Publisher{}} = Title.delete_publisher(publisher)
      assert_raise Ecto.NoResultsError, fn -> Title.get_publisher!(publisher.id) end
    end

    test "change_publisher/1 returns a publisher changeset" do
      publisher = publisher_fixture()
      assert %Ecto.Changeset{} = Title.change_publisher(publisher)
    end
  end

  describe "games" do
    alias Default.Title.Game

    @valid_attrs %{game: "some game", month: "some month", status: "some status"}
    @update_attrs %{game: "some updated game", month: "some updated month", status: "some updated status"}
    @invalid_attrs %{game: nil, month: nil, status: nil}

    def game_fixture(attrs \\ %{}) do
      {:ok, game} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Title.create_game()

      game
    end

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert Title.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert Title.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      assert {:ok, %Game{} = game} = Title.create_game(@valid_attrs)
      assert game.game == "some game"
      assert game.month == "some month"
      assert game.status == "some status"
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Title.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      assert {:ok, %Game{} = game} = Title.update_game(game, @update_attrs)
      assert game.game == "some updated game"
      assert game.month == "some updated month"
      assert game.status == "some updated status"
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = Title.update_game(game, @invalid_attrs)
      assert game == Title.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = Title.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> Title.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = Title.change_game(game)
    end
  end
end

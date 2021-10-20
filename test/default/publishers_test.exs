defmodule Default.PublishersTest do
  use Default.DataCase

  alias Default.Publishers

  describe "publishers" do
    alias Default.Publishers.Publisher

    @valid_attrs %{founded: "some founded", location: "some location", publisher: "some publisher"}
    @update_attrs %{founded: "some updated founded", location: "some updated location", publisher: "some updated publisher"}
    @invalid_attrs %{founded: nil, location: nil, publisher: nil}

    def publisher_fixture(attrs \\ %{}) do
      {:ok, publisher} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Publishers.create_publisher()

      publisher
    end

    test "list_publishers/0 returns all publishers" do
      publisher = publisher_fixture()
      assert Publishers.list_publishers() == [publisher]
    end

    test "get_publisher!/1 returns the publisher with given id" do
      publisher = publisher_fixture()
      assert Publishers.get_publisher!(publisher.id) == publisher
    end

    test "create_publisher/1 with valid data creates a publisher" do
      assert {:ok, %Publisher{} = publisher} = Publishers.create_publisher(@valid_attrs)
      assert publisher.founded == "some founded"
      assert publisher.location == "some location"
      assert publisher.publisher == "some publisher"
    end

    test "create_publisher/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Publishers.create_publisher(@invalid_attrs)
    end

    test "update_publisher/2 with valid data updates the publisher" do
      publisher = publisher_fixture()
      assert {:ok, %Publisher{} = publisher} = Publishers.update_publisher(publisher, @update_attrs)
      assert publisher.founded == "some updated founded"
      assert publisher.location == "some updated location"
      assert publisher.publisher == "some updated publisher"
    end

    test "update_publisher/2 with invalid data returns error changeset" do
      publisher = publisher_fixture()
      assert {:error, %Ecto.Changeset{}} = Publishers.update_publisher(publisher, @invalid_attrs)
      assert publisher == Publishers.get_publisher!(publisher.id)
    end

    test "delete_publisher/1 deletes the publisher" do
      publisher = publisher_fixture()
      assert {:ok, %Publisher{}} = Publishers.delete_publisher(publisher)
      assert_raise Ecto.NoResultsError, fn -> Publishers.get_publisher!(publisher.id) end
    end

    test "change_publisher/1 returns a publisher changeset" do
      publisher = publisher_fixture()
      assert %Ecto.Changeset{} = Publishers.change_publisher(publisher)
    end
  end
end

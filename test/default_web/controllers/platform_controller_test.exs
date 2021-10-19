defmodule DefaultWeb.PlatformControllerTest do
  use DefaultWeb.ConnCase

  alias Default.Platforms

  @create_attrs %{platform: "some platform"}
  @update_attrs %{platform: "some updated platform"}
  @invalid_attrs %{platform: nil}

  def fixture(:platform) do
    {:ok, platform} = Platforms.create_platform(@create_attrs)
    platform
  end

  describe "index" do
    test "lists all platforms", %{conn: conn} do
      conn = get(conn, Routes.platform_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Platforms"
    end
  end

  describe "new platform" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.platform_path(conn, :new))
      assert html_response(conn, 200) =~ "New Platform"
    end
  end

  describe "create platform" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.platform_path(conn, :create), platform: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.platform_path(conn, :show, id)

      conn = get(conn, Routes.platform_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Platform"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.platform_path(conn, :create), platform: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Platform"
    end
  end

  describe "edit platform" do
    setup [:create_platform]

    test "renders form for editing chosen platform", %{conn: conn, platform: platform} do
      conn = get(conn, Routes.platform_path(conn, :edit, platform))
      assert html_response(conn, 200) =~ "Edit Platform"
    end
  end

  describe "update platform" do
    setup [:create_platform]

    test "redirects when data is valid", %{conn: conn, platform: platform} do
      conn = put(conn, Routes.platform_path(conn, :update, platform), platform: @update_attrs)
      assert redirected_to(conn) == Routes.platform_path(conn, :show, platform)

      conn = get(conn, Routes.platform_path(conn, :show, platform))
      assert html_response(conn, 200) =~ "some updated platform"
    end

    test "renders errors when data is invalid", %{conn: conn, platform: platform} do
      conn = put(conn, Routes.platform_path(conn, :update, platform), platform: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Platform"
    end
  end

  describe "delete platform" do
    setup [:create_platform]

    test "deletes chosen platform", %{conn: conn, platform: platform} do
      conn = delete(conn, Routes.platform_path(conn, :delete, platform))
      assert redirected_to(conn) == Routes.platform_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.platform_path(conn, :show, platform))
      end
    end
  end

  defp create_platform(_) do
    platform = fixture(:platform)
    %{platform: platform}
  end
end

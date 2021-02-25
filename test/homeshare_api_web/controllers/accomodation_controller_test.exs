defmodule HomeshareApiWeb.AccomodationControllerTest do
  use HomeshareApiWeb.ConnCase

  alias HomeshareApi.Homeshare
  alias HomeshareApi.Homeshare.Accomodation

  @create_attrs %{
    city: "some city",
    description: "some description",
    max_guests: 42,
    name: "some name",
    state: "some state",
    street: "some street",
    type: "some type",
    unit: "some unit",
    user_id: 42,
    zip: 42
  }
  @update_attrs %{
    city: "some updated city",
    description: "some updated description",
    max_guests: 43,
    name: "some updated name",
    state: "some updated state",
    street: "some updated street",
    type: "some updated type",
    unit: "some updated unit",
    user_id: 43,
    zip: 43
  }
  @invalid_attrs %{city: nil, description: nil, max_guests: nil, name: nil, state: nil, street: nil, type: nil, unit: nil, user_id: nil, zip: nil}

  def fixture(:accomodation) do
    {:ok, accomodation} = Homeshare.create_accomodation(@create_attrs)
    accomodation
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all accomodations", %{conn: conn} do
      conn = get(conn, Routes.accomodation_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create accomodation" do
    test "renders accomodation when data is valid", %{conn: conn} do
      conn = post(conn, Routes.accomodation_path(conn, :create), accomodation: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.accomodation_path(conn, :show, id))

      assert %{
               "id" => id,
               "city" => "some city",
               "description" => "some description",
               "max_guests" => 42,
               "name" => "some name",
               "state" => "some state",
               "street" => "some street",
               "type" => "some type",
               "unit" => "some unit",
               "user_id" => 42,
               "zip" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.accomodation_path(conn, :create), accomodation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update accomodation" do
    setup [:create_accomodation]

    test "renders accomodation when data is valid", %{conn: conn, accomodation: %Accomodation{id: id} = accomodation} do
      conn = put(conn, Routes.accomodation_path(conn, :update, accomodation), accomodation: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.accomodation_path(conn, :show, id))

      assert %{
               "id" => id,
               "city" => "some updated city",
               "description" => "some updated description",
               "max_guests" => 43,
               "name" => "some updated name",
               "state" => "some updated state",
               "street" => "some updated street",
               "type" => "some updated type",
               "unit" => "some updated unit",
               "user_id" => 43,
               "zip" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, accomodation: accomodation} do
      conn = put(conn, Routes.accomodation_path(conn, :update, accomodation), accomodation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete accomodation" do
    setup [:create_accomodation]

    test "deletes chosen accomodation", %{conn: conn, accomodation: accomodation} do
      conn = delete(conn, Routes.accomodation_path(conn, :delete, accomodation))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.accomodation_path(conn, :show, accomodation))
      end
    end
  end

  defp create_accomodation(_) do
    accomodation = fixture(:accomodation)
    %{accomodation: accomodation}
  end
end

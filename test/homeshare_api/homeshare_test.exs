defmodule HomeshareApi.HomeshareTest do
  use HomeshareApi.DataCase

  alias HomeshareApi.Homeshare

  describe "accomodations" do
    alias HomeshareApi.Homeshare.Accomodation

    @valid_attrs %{city: "some city", description: "some description", max_guests: 42, name: "some name", state: "some state", street: "some street", type: "some type", unit: "some unit", user_id: 42, zip: 42}
    @update_attrs %{city: "some updated city", description: "some updated description", max_guests: 43, name: "some updated name", state: "some updated state", street: "some updated street", type: "some updated type", unit: "some updated unit", user_id: 43, zip: 43}
    @invalid_attrs %{city: nil, description: nil, max_guests: nil, name: nil, state: nil, street: nil, type: nil, unit: nil, user_id: nil, zip: nil}

    def accomodation_fixture(attrs \\ %{}) do
      {:ok, accomodation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Homeshare.create_accomodation()

      accomodation
    end

    test "list_accomodations/0 returns all accomodations" do
      accomodation = accomodation_fixture()
      assert Homeshare.list_accomodations() == [accomodation]
    end

    test "get_accomodation!/1 returns the accomodation with given id" do
      accomodation = accomodation_fixture()
      assert Homeshare.get_accomodation!(accomodation.id) == accomodation
    end

    test "create_accomodation/1 with valid data creates a accomodation" do
      assert {:ok, %Accomodation{} = accomodation} = Homeshare.create_accomodation(@valid_attrs)
      assert accomodation.city == "some city"
      assert accomodation.description == "some description"
      assert accomodation.max_guests == 42
      assert accomodation.name == "some name"
      assert accomodation.state == "some state"
      assert accomodation.street == "some street"
      assert accomodation.type == "some type"
      assert accomodation.unit == "some unit"
      assert accomodation.user_id == 42
      assert accomodation.zip == 42
    end

    test "create_accomodation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Homeshare.create_accomodation(@invalid_attrs)
    end

    test "update_accomodation/2 with valid data updates the accomodation" do
      accomodation = accomodation_fixture()
      assert {:ok, %Accomodation{} = accomodation} = Homeshare.update_accomodation(accomodation, @update_attrs)
      assert accomodation.city == "some updated city"
      assert accomodation.description == "some updated description"
      assert accomodation.max_guests == 43
      assert accomodation.name == "some updated name"
      assert accomodation.state == "some updated state"
      assert accomodation.street == "some updated street"
      assert accomodation.type == "some updated type"
      assert accomodation.unit == "some updated unit"
      assert accomodation.user_id == 43
      assert accomodation.zip == 43
    end

    test "update_accomodation/2 with invalid data returns error changeset" do
      accomodation = accomodation_fixture()
      assert {:error, %Ecto.Changeset{}} = Homeshare.update_accomodation(accomodation, @invalid_attrs)
      assert accomodation == Homeshare.get_accomodation!(accomodation.id)
    end

    test "delete_accomodation/1 deletes the accomodation" do
      accomodation = accomodation_fixture()
      assert {:ok, %Accomodation{}} = Homeshare.delete_accomodation(accomodation)
      assert_raise Ecto.NoResultsError, fn -> Homeshare.get_accomodation!(accomodation.id) end
    end

    test "change_accomodation/1 returns a accomodation changeset" do
      accomodation = accomodation_fixture()
      assert %Ecto.Changeset{} = Homeshare.change_accomodation(accomodation)
    end
  end
end

defmodule HomeshareApi.Homeshare.Accomodation do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "accomodations" do
    field :city, :string
    field :description, :string
    field :max_guests, :integer
    field :name, :string
    field :state, :string
    field :street, :string
    field :type, :string
    field :unit, :string
    field :user_id, :integer
    field :zip, :integer

    timestamps()
  end

  @doc false
  def changeset(accomodation, attrs) do
    accomodation
    |> cast(attrs, [:name, :description, :street, :unit, :city, :state, :zip, :type, :user_id, :max_guests])
    |> validate_required([:name, :description, :street, :unit, :city, :state, :zip, :type, :user_id, :max_guests])
  end
end

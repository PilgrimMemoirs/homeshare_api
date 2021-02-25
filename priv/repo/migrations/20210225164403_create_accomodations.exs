defmodule HomeshareApi.Repo.Migrations.CreateAccomodations do
  use Ecto.Migration

  def change do
    create table(:accomodations, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :description, :text
      add :street, :string
      add :unit, :string
      add :city, :string
      add :state, :string
      add :zip, :integer
      add :type, :string
      add :user_id, :integer
      add :max_guests, :integer

      timestamps()
    end

  end
end

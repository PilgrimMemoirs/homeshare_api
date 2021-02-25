defmodule HomeshareApiWeb.AccomodationView do
  use HomeshareApiWeb, :view
  alias HomeshareApiWeb.AccomodationView

  def render("index.json", %{accomodations: accomodations}) do
    %{data: render_many(accomodations, AccomodationView, "accomodation.json")}
  end

  def render("show.json", %{accomodation: accomodation}) do
    %{data: render_one(accomodation, AccomodationView, "accomodation.json")}
  end

  def render("accomodation.json", %{accomodation: accomodation}) do
    %{id: accomodation.id,
      name: accomodation.name,
      description: accomodation.description,
      street: accomodation.street,
      unit: accomodation.unit,
      city: accomodation.city,
      state: accomodation.state,
      zip: accomodation.zip,
      type: accomodation.type,
      user_id: accomodation.user_id,
      max_guests: accomodation.max_guests}
  end
end

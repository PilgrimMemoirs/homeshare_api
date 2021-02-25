defmodule HomeshareApiWeb.AccomodationController do
  use HomeshareApiWeb, :controller

  alias HomeshareApi.Homeshare
  alias HomeshareApi.Homeshare.Accomodation

  action_fallback HomeshareApiWeb.FallbackController

  def index(conn, _params) do
    accomodations = Homeshare.list_accomodations()
    render(conn, "index.json", accomodations: accomodations)
  end

  def create(conn, %{"accomodation" => accomodation_params}) do
    with {:ok, %Accomodation{} = accomodation} <- Homeshare.create_accomodation(accomodation_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.accomodation_path(conn, :show, accomodation))
      |> render("show.json", accomodation: accomodation)
    end
  end

  def show(conn, %{"id" => id}) do
    accomodation = Homeshare.get_accomodation!(id)
    render(conn, "show.json", accomodation: accomodation)
  end

  def update(conn, %{"id" => id, "accomodation" => accomodation_params}) do
    accomodation = Homeshare.get_accomodation!(id)

    with {:ok, %Accomodation{} = accomodation} <- Homeshare.update_accomodation(accomodation, accomodation_params) do
      render(conn, "show.json", accomodation: accomodation)
    end
  end

  def delete(conn, %{"id" => id}) do
    accomodation = Homeshare.get_accomodation!(id)

    with {:ok, %Accomodation{}} <- Homeshare.delete_accomodation(accomodation) do
      send_resp(conn, :no_content, "")
    end
  end
end

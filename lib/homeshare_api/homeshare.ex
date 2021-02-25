defmodule HomeshareApi.Homeshare do
  @moduledoc """
  The Homeshare context.
  """

  import Ecto.Query, warn: false
  alias HomeshareApi.Repo

  alias HomeshareApi.Homeshare.Accomodation

  @doc """
  Returns the list of accomodations.

  ## Examples

      iex> list_accomodations()
      [%Accomodation{}, ...]

  """
  def list_accomodations do
    Repo.all(Accomodation)
  end

  @doc """
  Gets a single accomodation.

  Raises `Ecto.NoResultsError` if the Accomodation does not exist.

  ## Examples

      iex> get_accomodation!(123)
      %Accomodation{}

      iex> get_accomodation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_accomodation!(id), do: Repo.get!(Accomodation, id)

  @doc """
  Creates a accomodation.

  ## Examples

      iex> create_accomodation(%{field: value})
      {:ok, %Accomodation{}}

      iex> create_accomodation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_accomodation(attrs \\ %{}) do
    %Accomodation{}
    |> Accomodation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a accomodation.

  ## Examples

      iex> update_accomodation(accomodation, %{field: new_value})
      {:ok, %Accomodation{}}

      iex> update_accomodation(accomodation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_accomodation(%Accomodation{} = accomodation, attrs) do
    accomodation
    |> Accomodation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a accomodation.

  ## Examples

      iex> delete_accomodation(accomodation)
      {:ok, %Accomodation{}}

      iex> delete_accomodation(accomodation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_accomodation(%Accomodation{} = accomodation) do
    Repo.delete(accomodation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking accomodation changes.

  ## Examples

      iex> change_accomodation(accomodation)
      %Ecto.Changeset{data: %Accomodation{}}

  """
  def change_accomodation(%Accomodation{} = accomodation, attrs \\ %{}) do
    Accomodation.changeset(accomodation, attrs)
  end
end

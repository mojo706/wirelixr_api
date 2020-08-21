defmodule WirelixrApi.Locations.Location do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locations" do
    field :centre, :string
    field :country, :string
    field :id, :binary
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:id, :name, :centre, :country])
    |> validate_required([:id, :name, :centre, :country])
  end
end

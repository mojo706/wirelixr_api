defmodule WirelixrApi.Incidents.Incident do
  use Ecto.Schema
  import Ecto.Changeset

  schema "incidents" do
    field :date_occured, :date
    field :description, :string
    field :subject, :string
    field :category_id, :id
    field :status_id, :id
    field :location_id, :id
    field :level_id, :id

    timestamps()
  end

  @doc false
  def changeset(incident, attrs) do
    incident
    |> cast(attrs, [:id, :description, :subject, :date_occured])
    |> validate_required([:id, :description, :subject, :date_occured])
  end
end

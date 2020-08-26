defmodule WirelixrApi.Incidents.Incident do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "incidents" do
    field :date_occured, :date
    field :description, :string
    field :subject, :string
    belongs_to :category, WirelixrApi.Categories.Category
    belongs_to :status, WirelixrApi.Statuses.Status
    belongs_to :location, WirelixrApi.Locations.Location
    belongs_to :level, WirelixrApi.Levels.Level
    many_to_many :incident_reporter, WirelixrApi.Accounts.User, join_through: "users_have_incidents"
    many_to_many :incident_assignees, WirelixrApi.Accounts.User, join_through: "assignees_have_incidents"
    many_to_many :incident_witnesses, WirelixrApi.Accounts.User, join_through: "witnesses"

    timestamps()
  end

  @doc false
  def changeset(incident, attrs) do
    incident
    |> cast(attrs, [:id, :description, :subject, :date_occured])
    |> validate_required([:id, :description, :subject, :date_occured])
  end
end

defmodule WirelixrApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "users" do
    many_to_many :reported_incidents, WirelixrApi.Incidents.Incident, join_through: "users_have_incidents"
    many_to_many :assigned_incidents, WirelixrApi.Incidents.Incident, join_through: "assignees_have_incidents"
    many_to_many :incident_witnesses, WirelixrApi.Incidents.Incident, join_through: "witnesses"
    field :email, :string, unique: true
    field :first_name, :string
    field :last_name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :slack_id, :string
    field :image_url, :string
    belongs_to :location, WirelixrApi.Locations.Location
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:slack_id, :first_name, :last_name, :email, :password, :password_confirmation])
    |> validate_required([:slack_id, :first_name, :last_name, :email])
    |> validate_confirmation(:password)
    |> put_password_hash()
  end
  
  @doc false
  def create_changeset(user, role, attrs) do
    user
    |> changeset(attrs)
    |> put_change(:role, role)
  end
  
  defp put_password_hash(changeset) do
    case get_change(changeset, :password) do
      nil ->
        changeset
      
      password ->
        password_hash = generate_password_hash(password)
        put_change(changeset, :password_hash, password_hash)
    end
  end
  
  defp generate_password_hash(password) do
    # Generate your password hash
  end
end

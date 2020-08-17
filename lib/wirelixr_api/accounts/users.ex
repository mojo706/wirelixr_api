defmodule WirelixrApi.Accounts.Users do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password_hash, :string
    field :role, :string

    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:first_name, :last_name, :email, :password_hash, :role])
    |> validate_required([:first_name, :last_name, :email, :password_hash, :role])
  end
end

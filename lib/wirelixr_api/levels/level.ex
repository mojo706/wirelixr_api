defmodule WirelixrApi.Levels.Level do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "levels" do
    field :name, :string, unique: true

    timestamps()
  end

  @doc false
  def changeset(level, attrs) do
    level
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

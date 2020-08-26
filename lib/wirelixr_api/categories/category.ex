defmodule WirelixrApi.Categories.Category do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "categories" do
    field :name, :string
    field :visible, :boolean, default: false
    field :levelId, :id

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :visible])
    |> validate_required([:name, :visible])
    |> unique_constraint(:name)
  end
end

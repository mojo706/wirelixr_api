defmodule WirelixrApi.Statuses.Status do
  use Ecto.Schema
  import Ecto.Changeset

  schema "statuses" do
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(status, attrs) do
    status
    |> cast(attrs, [:status])
    |> validate_required([:status])
  end
end

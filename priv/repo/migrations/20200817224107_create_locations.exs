defmodule WirelixrApi.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :id, :binary
      add :name, :string
      add :centre, :string
      add :country, :string

      timestamps()
    end

  end
end

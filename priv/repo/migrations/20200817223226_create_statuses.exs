defmodule WirelixrApi.Repo.Migrations.CreateStatuses do
  use Ecto.Migration

  def change do
    create table(:statuses) do
      add :status, :string

      timestamps()
    end

  end
end

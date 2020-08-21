defmodule WirelixrApi.Repo.Migrations.CreateIncidents do
  use Ecto.Migration

  def change do
    create table(:incidents) do
      add :id, :uuid
      add :description, :text
      add :subject, :text
      add :date_occured, :date
      add :category_id, references(:categories, on_delete: :delete_all)
      add :status_id, references(:statuses, on_delete: :delete_all)
      add :location_id, references(:locations, on_delete: :delete_all)
      add :level_id, references(:levels, on_delete: :delete_all)

      timestamps()
    end

    create index(:incidents, [:category_id])
    create index(:incidents, [:status_id])
    create index(:incidents, [:location_id])
    create index(:incidents, [:level_id])
  end
end

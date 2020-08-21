defmodule WirelixrApi.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :visible, :boolean, default: false, null: false
      add :levelId, references(:levels, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:categories, [:name])
    create index(:categories, [:levelId])
  end
end

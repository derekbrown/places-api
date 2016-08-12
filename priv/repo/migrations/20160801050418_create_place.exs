defmodule Savor.Repo.Migrations.CreatePlace do
  use Ecto.Migration

  def change do
    create table(:places) do
      add :name, :string
      add :phone, [:map, :string]
      add :url, [:map, :string]
      add :type, [:map, :string]
      add :cuisine, [:map, :string]
      add :rating, :decimal
      add :category, [:map, :string]
      add :price_range, :string
      add :info, [:map, :string]
      add :highlights, [:map, :string]
      add :avoid, [:map, :string]
      add :reviews, references(:reviews, on_delete: :nothing)
      add :photos, [:map, :string]
      add :visits, references(:visits, on_delete: :nothing)

      timestamps()
    end

    create index(:places, [:reviews])
    create index(:places, [:photos])
    create index(:places, [:visits])

  end
end

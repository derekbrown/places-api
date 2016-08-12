defmodule Savor.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :username, :string
      add :user_type, :string
      add :password_hash, :string
      add :email, {:map, :string}
      add :rating, :decimal
      add :photos, {:map, :string}
      add :reviews, references(:reviews, on_delete: :nothing)
      add :connections, references(:users, on_delete: :nothing)
      add :favorites, references(:places, on_delete: :nothing)
      add :saved, references(:places, on_delete: :nothing)
      add :visits, references(:visits, on_delete: :nothing)
      timestamps
    end
    create index(:users, [:photos])
    create index(:users, [:reviews])
    create index(:users, [:connections])
    create index(:users, [:favorites])
    create index(:users, [:saved])
    create index(:users, [:visits])
  end
end

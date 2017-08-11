defmodule DataLogger.Repo.Migrations.CreateSensor do
  use Ecto.Migration

  def change do
    create table(:sensors) do
      add :temp, :string
      add :humidity, :string
      add :sensor3, :string
      add :sensor4, :string

      timestamps()
    end
  end
end

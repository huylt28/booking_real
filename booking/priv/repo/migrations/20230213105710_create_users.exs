defmodule Booking.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :phone, :integer
      add :mail, :string
      add :url, :string
      add :description, :string

      timestamps()
    end
  end
end

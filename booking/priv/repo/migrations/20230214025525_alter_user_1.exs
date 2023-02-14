defmodule Booking.Repo.Migrations.AlterUser1 do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add(:user_name, :string)
    end
  end
end

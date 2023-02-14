defmodule Booking.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:description, :string)
    field(:mail, :string)
    field(:name, :string)
    field(:phone, :integer)
    field(:url, :string)
    field(:user_name, :string)
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :phone, :mail, :user_name])
    |> validate_required([:name, :phone, :mail, :user_name])
  end
end

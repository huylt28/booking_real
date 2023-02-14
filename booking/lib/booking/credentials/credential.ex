defmodule Booking.Credentials.Credential do
  use Ecto.Schema
  import Ecto.Changeset

  schema "credentials" do
    field :hash_password, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:hash_password])
    |> validate_required([:hash_password])
  end
end

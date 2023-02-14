defmodule Booking.CredentialsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Booking.Credentials` context.
  """

  @doc """
  Generate a credential.
  """
  def credential_fixture(attrs \\ %{}) do
    {:ok, credential} =
      attrs
      |> Enum.into(%{
        hash_password: "some hash_password"
      })
      |> Booking.Credentials.create_credential()

    credential
  end
end

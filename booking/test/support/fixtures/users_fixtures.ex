defmodule Booking.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Booking.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        description: "some description",
        mail: "some mail",
        name: "some name",
        phone: 42,
        url: "some url"
      })
      |> Booking.Users.create_user()

    user
  end
end

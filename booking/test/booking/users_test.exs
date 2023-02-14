defmodule Booking.UsersTest do
  use Booking.DataCase

  alias Booking.Users

  describe "users" do
    alias Booking.Users.User

    import Booking.UsersFixtures

    @invalid_attrs %{description: nil, mail: nil, name: nil, phone: nil, url: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Users.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{description: "some description", mail: "some mail", name: "some name", phone: 42, url: "some url"}

      assert {:ok, %User{} = user} = Users.create_user(valid_attrs)
      assert user.description == "some description"
      assert user.mail == "some mail"
      assert user.name == "some name"
      assert user.phone == 42
      assert user.url == "some url"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{description: "some updated description", mail: "some updated mail", name: "some updated name", phone: 43, url: "some updated url"}

      assert {:ok, %User{} = user} = Users.update_user(user, update_attrs)
      assert user.description == "some updated description"
      assert user.mail == "some updated mail"
      assert user.name == "some updated name"
      assert user.phone == 43
      assert user.url == "some updated url"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert user == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end
end

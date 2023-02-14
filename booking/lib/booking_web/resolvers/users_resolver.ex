defmodule BookingWeb.UsersResolver do
  alias Booking.Users

  def all_users(_root, _args, _info) do
    # Doc:
    # Get data from tb
    data = News.list_users()
    # Handle logic if need
    ######
    {:ok, data}
  end

  def create_user(_root, args, _info) do
    # TODO: add detailed error message handling later
    case Users.create_user(args.input) do
      {:ok, user} ->
        {:ok, user}

      _error ->
        {:error, "could not create account"}
    end
  end

  def update_user(_root, args, _info) do
    # TODO: add detailed error message handling later
    case Users.get_user!(args.input.id) do
      data ->
        case Users.update_user(data, args.input) do
          {:ok, user} ->
            {:ok, user}

          _error ->
            {:error, "could not updated user"}
        end

      _error ->
        {:error, "could not find user"}
    end
  end

  def delete_user(_root, args, _info) do
    # TODO: add detailed error message handling later
    case Users.get_user!(args.id) do
      data ->
        case Users.delete_user(data) do
          {:ok, user} ->
            {:ok, user}

          _error ->
            {:error, "could not delete user"}
        end

      _error ->
        {:error, "could not find user"}
    end
  end
end

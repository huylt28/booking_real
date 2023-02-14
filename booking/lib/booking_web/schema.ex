defmodule BookingWeb.Schema do
  use Absinthe.Schema

  alias BookingWeb.UsersResolver

  object :user do
    field(:id, non_null(:id))
    field(:name, non_null(:string))
    field(:phone, non_null(:integer))
    field(:mail, non_null(:string))
    field(:user_name, non_null(:string))
  end

  query do
    @desc "Get User"
    field :all_users, non_null(list_of(non_null(:user))) do
      resolve(&UsersResolver.all_users/3)
    end
  end

  input_object :user_input do
    field(:id, :id)
    field(:name, :string)
    field(:phone, :integer)
    field(:user_name, :string)
    field(:mail, :string)
  end

  mutation do
    @desc "Create a new account"
    field :create_user, :user do
      arg(:input, :user_input)

      resolve(&UsersResolver.create_user/3)
    end

    @desc "Update User"
    field :update_user, :user do
      arg(:input, :user_input)

      resolve(&UsersResolver.update_user/3)
    end

    @desc "Delete User"
    field :delete_user, :user do
      arg(:id, non_null(:id))

      resolve(&UsersResolver.delete_user/3)
    end
  end
end

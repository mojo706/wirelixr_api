defmodule WirelixrApi.AccountsTest do
  use WirelixrApi.DataCase

  alias WirelixrApi.Accounts

  describe "users" do
    alias WirelixrApi.Accounts.Users

    @valid_attrs %{
      email: "some email",
      first_name: "some first_name",
      last_name: "some last_name",
      password_hash: "some password_hash",
      role: "some role"
    }
    @update_attrs %{
      email: "some updated email",
      first_name: "some updated first_name",
      last_name: "some updated last_name",
      password_hash: "some updated password_hash",
      role: "some updated role"
    }
    @invalid_attrs %{email: nil, first_name: nil, last_name: nil, password_hash: nil, role: nil}

    def users_fixture(attrs \\ %{}) do
      {:ok, users} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_users()

      users
    end

    test "list_users/0 returns all users" do
      users = users_fixture()
      assert Accounts.list_users() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert Accounts.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      assert {:ok, %Users{} = users} = Accounts.create_users(@valid_attrs)
      assert users.email == "some email"
      assert users.first_name == "some first_name"
      assert users.last_name == "some last_name"
      assert users.password_hash == "some password_hash"
      assert users.role == "some role"
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()
      assert {:ok, %Users{} = users} = Accounts.update_users(users, @update_attrs)
      assert users.email == "some updated email"
      assert users.first_name == "some updated first_name"
      assert users.last_name == "some updated last_name"
      assert users.password_hash == "some updated password_hash"
      assert users.role == "some updated role"
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_users(users, @invalid_attrs)
      assert users == Accounts.get_users!(users.id)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = Accounts.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_users!(users.id) end
    end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = Accounts.change_users(users)
    end
  end
end

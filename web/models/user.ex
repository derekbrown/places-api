defmodule Savor.User do
  use Savor.Web, :model
  use Arc.Ecto.Schema

  schema "users" do
    field :username, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :first_name, :string
    field :last_name, :string
    field :user_type, :string
    field :email, {:map, :string}
    field :rating, :decimal
    has_many :photos, Savor.Photo.Type
    has_many :reviews, Savor.Review
    has_many :connections, Savor.User
    has_many :favorites, Savor.Place
    has_many :saved, Savor.Place
    has_many :visits, Savor.Visit
    has_many :rooms, Savor.Room
    timestamps
  end

  @required_fields ~w(username password password_confirmation)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast_attachments(params, [:photos])
    |> validate_length(:password, min: 8)
    |> validate_confirmation(:password)
    |> hash_password
    |> unique_constraint(:username)
  end

  defp hash_password(%{valid?: false} = changeset), do: changeset
  defp hash_password(%{valid?: true} = changeset) do
    hashedpw = Comeonin.Bcrypt.hashpwsalt(Ecto.Changeset.get_field(changeset, :password))
    Ecto.Changeset.put_change(changeset, :password_hash, hashedpw)
  end
end

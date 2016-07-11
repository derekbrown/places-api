defmodule Places.Room do
  use Places.Web, :model

  @primary_key {:id, :id, autogenerate: true}
  schema "rooms" do
    field :name, :string
    belongs_to :owner, Places.Owner

    timestamps()
  end

  @required_fields ~w(name owner)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> cast_assoc(:owner, required: false)
    |> validate_required(:name, min: 3)
    |> unique_constraint(:name)
  end
end

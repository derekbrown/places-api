defmodule Savor.Review do
  use Savor.Web, :model

  schema "reviews" do
    field :text, :string
    field :rating, :decimal
    belongs_to :user, Savor.User
    belongs_to :place, Savor.Place

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:text, :rating])
    |> validate_required([:text, :rating])
  end
end

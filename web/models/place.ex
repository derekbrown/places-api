defmodule Savor.Place do
  use Savor.Web, :model
  use Arc.Ecto.Schema

  schema "places" do
    field :name, :string
    field :phone, :string
    field :url, :string
    field :type, :string
    field :cuisine, :string
    field :rating, :decimal
    field :category, :string
    field :price_range, :string
    field :info, :string
    field :highlights, :string
    field :avoid, :string
    has_many :reviews, Savor.Review
    has_many :photos, Savor.Photo.Type
    has_many :visits, Savor.Visit

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :phone, :url, :type, :cuisine, :rating, :category, :price_range, :info, :highlights, :avoid])
    |> cast_attachments(params, [:photos])
    |> validate_required([:name, :phone, :url, :type, :cuisine, :rating, :category, :price_range, :info, :highlights, :avoid])
  end
end

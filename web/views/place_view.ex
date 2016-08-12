defmodule Savor.PlaceView do
  use Savor.Web, :view

  def render("index.json", %{places: places}) do
    %{data: render_many(places, Savor.PlaceView, "place.json")}
  end

  def render("show.json", %{place: place}) do
    %{data: render_one(place, Savor.PlaceView, "place.json")}
  end

  def render("place.json", %{place: place}) do
    %{id: place.id,
      name: place.name,
      phone: place.phone,
      url: place.url,
      type: place.type,
      cuisine: place.cuisine,
      rating: place.rating,
      category: place.category,
      reviews: place.reviews,
      photos: place.photos,
      price_range: place.price_range,
      info: place.info,
      highlights: place.highlights,
      avoid: place.avoid,
      visits: place.visits}
  end
end

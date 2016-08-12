defmodule Savor.ErrorViewTest do
  use Savor.ConnCase, async: true

  import Phoenix.View

  test "renders 404.json" do
    assert render(Savor.ErrorView, "404.json", []) ==
           %{errors: [%{code: 404, title: "Page Not Found"}]}
  end

  test "render 500.json" do
    assert render(Savor.ErrorView, "500.json", []) ==
           %{errors: [%{code: 500, title: "Internal Server Error"}]}
  end

  test "render any other" do
    assert render(Savor.ErrorView, "505.json", []) ==
           %{errors: [%{code: 500, title: "Internal Server Error"}]}
  end
end

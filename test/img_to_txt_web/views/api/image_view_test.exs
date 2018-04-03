defmodule ImgToTxtWeb.API.ImageViewTest do
  use ImgToTxtWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders index.js" do
    viewInput = %{
      Text: "Awesome image text"
    }

    expectedViewReponse = %{
      text: "Awesome image text"
    }

    assert render(ImgToTxtWeb.API.ImageView, "index.json", viewInput) == expectedViewReponse
  end
end

defmodule ImgToTxtWeb.API.ImageViewTest do
  use ImgToTxtWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  describe "renders index.js" do
    test "success" do
      viewInput = %{
        Text: "Awesome image text"
      }

      expectedViewReponse = %{
        text: "Awesome image text"
      }

      assert render(ImgToTxtWeb.API.ImageView, "index.json", viewInput) == expectedViewReponse
    end

    test "errors" do
      viewInput = %{
        Errors: [
          %{
            Message: "Image size 5965717 in bytes is not in allowed range.",
            Title: "Image Size Error"
          }
        ]
      }

      expectedViewReponse = %{
        errors: ["Image Size Error"]
      }

      assert render(ImgToTxtWeb.API.ImageView, "index.json", viewInput) == expectedViewReponse
    end
  end
end

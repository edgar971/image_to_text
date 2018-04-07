defmodule ImgToTxtWeb.API.ImageController do
  use ImgToTxtWeb, :controller

  @cognitive_api Application.get_env(:img_to_txt, :cognitive_api)

  def create(conn, %{"image" => %{path: imagePath}}) do
    response = @cognitive_api.get_text_from_image(imagePath)
    render(conn, "index.json", response)
  end
end

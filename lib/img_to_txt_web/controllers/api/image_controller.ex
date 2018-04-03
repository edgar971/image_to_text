defmodule ImgToTxtWeb.API.ImageController do
  use ImgToTxtWeb, :controller

  @cognitive_api Application.get_env(:img_to_txt, :cognitive_api)

  def create(conn, %{"image" => %{path: imagePath, content_type: content_type}}) do
    response = @cognitive_api.get_text_from_image(imagePath, content_type)
    render(conn, "index.json", response)
  end
end

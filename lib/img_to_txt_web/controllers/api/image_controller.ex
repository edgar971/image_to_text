defmodule ImgToTxtWeb.API.ImageController do
  use ImgToTxtWeb, :controller
  alias ImgToTxt.Utils.Image

  @cognitive_api Application.get_env(:img_to_txt, :cognitive_api)

  def create(conn, %{"image" => %{path: imagePath, content_type: content_type}}) do
    %{path: path} = imagePath |> Image.resize(1200, 1200)

    response = @cognitive_api.get_text_from_image(path, content_type)
    render(conn, "index.json", response)
  end
end

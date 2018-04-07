defmodule ImgToTxtWeb.PageController do
  use ImgToTxtWeb, :controller
  @cognitive_api Application.get_env(:img_to_txt, :cognitive_api)

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, %{"image" => %{path: image_path, content_type: content_type}}) do
    response = @cognitive_api.get_text_from_image(image_path, content_type)

    case response do
      %{Text: image_text} ->
        conn
        |> put_flash(:info, image_text)
        |> render("text.html")
    end
  end
end

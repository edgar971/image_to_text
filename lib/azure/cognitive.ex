defmodule ImgToTxt.Azure.CognitiveClient do
  @jpeg "image/jpeg"
  @png "image/png"
  @gif "image/gif"

  @cognitive_api_url Application.get_env(:img_to_txt, :cognitive_api_url)
  @cognitive_api_key Application.get_env(:img_to_txt, :cognitive_api_key)

  def get_text_from_image(imagePath) do
    content_type = mime_type(imagePath)

    response =
      HTTPoison.post(@cognitive_api_url, {:file, imagePath}, [
        {"content-type", content_type},
        {"Ocp-Apim-Subscription-Key", @cognitive_api_key}
      ])

    case response do
      {:ok, %{body: body}} -> body |> Poison.decode!(keys: :atoms)
    end
  end

  defp mime_type(filename) do
    case Path.extname(filename) do
      ".jpeg" -> @jpeg
      ".jpg" -> @jpeg
      ".png" -> @png
      ".gif" -> @gif
    end
  end
end

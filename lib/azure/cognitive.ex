defmodule ImgToTxt.Azure.CognitiveClient do
  @jpeg "image/jpeg"
  @jpg "image/jpg"
  @png "image/png"
  @gif "image/gif"

  @cognitive_api_url Application.get_env(:img_to_txt, :cognitive_api_url)
  @cognitive_api_key Application.get_env(:img_to_txt, :cognitive_api_key)

  def get_text_from_image(imagePath, content_type) do
    content_type = mime_type_mapper(content_type)

    response =
      HTTPoison.post(@cognitive_api_url, {:file, imagePath}, [
        {"content-type", content_type},
        {"Ocp-Apim-Subscription-Key", @cognitive_api_key}
      ])

    case response do
      {:ok, %{body: body}} -> body |> Poison.decode!(keys: :atoms)
    end
  end

  defp mime_type_mapper(content_type) do
    case content_type do
      @jpeg -> @jpeg
      @jpg -> @jpeg
      @png -> @png
      @gif -> @gif
    end
  end
end

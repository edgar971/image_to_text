defmodule ImgToTxt.Azure.CognitiveClient do
    @cognitive_api_url Application.get_env(:img_to_txt, :cognitive_api_url)
    @cognitive_api_key Application.get_env(:img_to_txt, :cognitive_api_key)

    def get_text_from_image(image) do
      response = HTTPoison.post(@cognitive_api_url, 
                    {:file, image},
                    [{"content-type", "image/png"},
                    {"Ocp-Apim-Subscription-Key", @cognitive_api_key}])

      case response do
        {:ok, %{body: body}} -> body |> Poison.decode!(keys: :atoms)
      end
    end
end

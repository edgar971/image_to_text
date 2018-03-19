defmodule ImgToTxt.Azure.CognitiveClientMock do
  def get_text_from_image(_image) do
    %{
      Text: "Best text message ever"
    }
  end
end

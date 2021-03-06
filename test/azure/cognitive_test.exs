defmodule ImgToTxt.Azure.CognitiveClientTest do
  use ExUnit.Case
  import ImgToTxt.Azure.CognitiveClient

  test "get_text_from_image for a valid image" do
    expectedResponse = %{
      :Text => "An Elixir Test \r\n"
    }

    %{path: path, content_type: content_type} = %Plug.Upload{
      content_type: "image/png",
      path: "test/assets/test.png",
      filename: "test.png"
    }

    response = get_text_from_image(path, content_type)

    assert Map.take(response, [:Text]) === expectedResponse
    Process.sleep(2000)
  end
end

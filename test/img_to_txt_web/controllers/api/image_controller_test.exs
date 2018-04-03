defmodule ImgToTxtWeb.API.ImageControllerTest do
  use ImgToTxtWeb.ConnCase

  test "POST /api/image", %{conn: conn} do
    expectedResponse = %{
      "text" => "An Elixir Test \r\n"
    }

    upload = %Plug.Upload{
      content_type: "image/png",
      path: "test/assets/test.png",
      filename: "test.png"
    }

    conn = post(conn, "/api/image", %{:image => upload})
    assert json_response(conn, 200) == expectedResponse
  end
end

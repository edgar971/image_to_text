defmodule ImgToTxtWeb.API.ImageControllerTest do
  use ImgToTxtWeb.ConnCase

  describe "POST /api/image" do
    test "success", %{conn: conn} do
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
      Process.sleep(2000)
    end

    test "image with no text", %{conn: conn} do
      expectedResponse = %{
        "text" => ""
      }

      upload = %Plug.Upload{
        content_type: "image/png",
        path: "test/assets/no-text.png",
        filename: "no-text.png"
      }

      conn = post(conn, "/api/image", %{:image => upload})
      assert json_response(conn, 200) == expectedResponse
      Process.sleep(2000)
    end
  end
end

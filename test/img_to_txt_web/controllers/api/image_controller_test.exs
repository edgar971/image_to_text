defmodule ImgToTxtWeb.API.ImageControllerTest do
  use ImgToTxtWeb.ConnCase

  test "POST /api/image", %{conn: conn} do
    expectedResponse = %{
      "text" => "Best text message ever"
    }
    
    conn = post conn, "/api/image", %{:image => %{}}
    assert json_response(conn, 200) == expectedResponse
  end
end

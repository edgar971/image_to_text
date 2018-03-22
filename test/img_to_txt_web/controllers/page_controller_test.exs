defmodule ImgToTxtWeb.PageControllerTest do
  use ImgToTxtWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Convert Image to Text"
  end

  test "POST /", %{conn: conn} do
    upload = %Plug.Upload{content_type: "image/png", path: "test/assets/test.png", filename: "test.png"}
    conn = post conn, "/", %{:image => upload}
    assert html_response(conn, 200) =~ "An Elixir Test"
    
    # Sleep to avoid API limit
    Process.sleep(2000)
  end
end

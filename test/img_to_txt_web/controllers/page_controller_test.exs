defmodule ImgToTxtWeb.PageControllerTest do
  use ImgToTxtWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Texto - A simple web app to extract text found in images."
  end
end

defmodule ImgToTxtWeb.API.ImageView do
  use ImgToTxtWeb, :view

  def render("index.json", %{Text: text}) do
    %{
      text: text
    }
  end
end

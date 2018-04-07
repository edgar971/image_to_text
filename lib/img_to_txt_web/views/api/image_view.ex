defmodule ImgToTxtWeb.API.ImageView do
  use ImgToTxtWeb, :view

  def render("index.json", %{Text: text}) do
    %{
      text: text
    }
  end

  def render("index.json", %{Errors: errors}) do
    %{
      errors: Enum.map(errors, fn(error) -> error[:Title] end)
    }
  end
end

defmodule ImgToTxt.Utils.Image do
  import Mogrify

  @doc """
  Resize images to help reduce file size
  """
  def resize(imagePath, width, height, opts \\ []) do
    open(imagePath)
    |> resize_to_limit(~s(#{width}x#{height}))
    |> save(opts)
  end
end

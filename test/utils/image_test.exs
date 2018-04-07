defmodule ImgToTxt.Utils.ImageTest do
  use ExUnit.Case

  alias ImgToTxt.Utils.Image

  describe "resize" do
    test "success" do
      expected_path = "test/assets/test-resized.png"
      %{path: path} = Image.resize("test/assets/test.png", 200, 200, path: expected_path)
      assert path == expected_path
    end

    test "missing file" do
      assert_raise File.Error, fn ->
        Image.resize("test/assets/missing.png", 200, 200)
      end
    end
  end
end

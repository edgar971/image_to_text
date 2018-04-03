defmodule ImgToTxtWeb.Router do
  use ImgToTxtWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", ImgToTxtWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    post("/", PageController, :create)
  end

  # Other scopes may use custom stacks.
  scope "/api", ImgToTxtWeb do
    pipe_through(:api)

    post("/image", API.ImageController, :create)
  end
end

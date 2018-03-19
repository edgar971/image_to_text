# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :img_to_txt,
  ecto_repos: [ImgToTxt.Repo]

# Configures the endpoint
config :img_to_txt, ImgToTxtWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "uaRXC1Pu90/PCtADPzqV+lhVYfSKdFbYinOKohyHnuEp9xduwe6/PxqKsHvUFVzf",
  render_errors: [view: ImgToTxtWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ImgToTxt.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


# Azure 
config :img_to_txt, :cognitive_api_key, System.get_env("AZURE_API_KEY")
config :img_to_txt, :cognitive_api_url, System.get_env("AZURE_API_URL") || "https://eastus.api.cognitive.microsoft.com/contentmoderator/moderate/v1.0/ProcessImage/OCR?language=eng&CacheImage=true&enhanced=false"

config :img_to_txt, :cognitive_api, ImgToTxt.Azure.CognitiveClient

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

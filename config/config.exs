import Config

config :logger, :console,
  format: "$message\n",
  colors: [
    enabled: true,
    debug: :light_black
  ]

defmodule HomeshareApi.Repo do
  use Ecto.Repo,
    otp_app: :homeshare_api,
    adapter: Ecto.Adapters.Postgres
end

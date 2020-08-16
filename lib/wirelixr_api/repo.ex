defmodule WirelixrApi.Repo do
  use Ecto.Repo,
    otp_app: :wirelixr_api,
    adapter: Ecto.Adapters.Postgres
end

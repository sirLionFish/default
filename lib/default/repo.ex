defmodule Default.Repo do
  use Ecto.Repo,
    otp_app: :default,
    adapter: Ecto.Adapters.Postgres
end

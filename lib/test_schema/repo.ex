defmodule TestSchema.Repo do
  use Ecto.Repo,
    otp_app: :test_schema,
    adapter: Ecto.Adapters.Postgres
end

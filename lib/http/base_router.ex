defmodule KV.BaseRouter do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  forward("/health", to: KV.HTTP.HealthRouter)

  match _ do
    conn |> send_resp(404, "")
  end
end

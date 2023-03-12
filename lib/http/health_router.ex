defmodule KV.HTTP.HealthRouter do
  use Plug.Router

  alias KV.Cache

  plug(:match)
  plug(:dispatch)

  get "/" do
    now = DateTime.utc_now()

    data = %{
      prev: Cache.get(:last_call),
      now: now
    }

    Cache.put(:last_call, now)

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(data))
  end

  match _ do
    conn |> send_resp(404, "")
  end
end

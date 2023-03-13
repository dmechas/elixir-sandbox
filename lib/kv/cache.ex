defmodule KV.Cache do
  @moduledoc false

  use Nebulex.Cache,
    otp_app: :kv,
    adapter: Nebulex.Adapters.Replicated,
    primary_storage_adapter: Nebulex.Adapters.Local
end

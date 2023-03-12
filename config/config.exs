import Config

config :kv, KV.Cache,
  # Max 1 million entries in cache
  max_size: 1_000_000,
  # Max 500 MB of memory
  allocated_memory: 500_000_000,
  primary: [
    gc_cleanup_min_timeout: :timer.seconds(10),
    gc_cleanup_max_timeout: :timer.minutes(10)
  ],
  stats: false,
  telemetry: false

config :kv, :base_router_endpoint, port: System.get_env("PORT", "8000") |> String.to_integer()

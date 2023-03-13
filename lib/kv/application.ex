defmodule KV.Application do
  use Application

  @moduledoc false

  @impl true
  def start(_type, _args) do
    topologies = [
      local_epmd: [strategy: Elixir.Cluster.Strategy.LocalEpmd]
    ]

    children = [
      KV.Cache,
      {
        Cluster.Supervisor,
        [topologies, [name: KV.ClusterSupervisor]]
      },
      {
        Plug.Cowboy,
        scheme: :http,
        plug: KV.BaseRouter,
        options: Application.get_env(:kv, :base_router_endpoint)
      }
    ]

    opts = [
      strategy: :one_for_one,
      name: KV.Supervisor
    ]

    Supervisor.start_link(children, opts)
  end
end

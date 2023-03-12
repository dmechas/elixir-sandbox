# KV

## Examples

Example of commands to play with node connection

```elixir
KV.Cache.get(:last_call)

Task.async(fn -> KV.Cache.get(:last_call) end) |> Task.await
```

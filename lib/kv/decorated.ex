#
# This is an example on how to create a decorator and use it
#
defmodule KV.LogDecorator do
  use Decorator.Define, print: 1

  def print(attrs, body, context) do
    level = attrs[:level] || raise ArgumentError, "expected level: to be given as argument"

    quote do
      IO.puts("Level: " <> Atom.to_string(unquote(level)))
      IO.puts("Function called: " <> Atom.to_string(unquote(context.name)))
      unquote(body)
    end
  end
end

defmodule KV.Decorated do
  use KV.LogDecorator

  @decorate print(level: :info)
  def f do
    :fout
  end

  @decorate print(level: :debug)
  def g do
    :gout
  end
end

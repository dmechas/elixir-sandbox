run:
	iex --sname node-A -S mix run

run-second-node:
	PORT=8001 iex --sname node-B -S mix run

test:
	mix test

test-watch:
	mix test.watch

lint:
	mix credo
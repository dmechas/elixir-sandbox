run:
	iex --sname node-A -S mix run

run-second-node:
	PORT=8001 iex --sname node-B -S mix run

remote:
	iex --sname node-REMOTE --remsh node-A

test:
	mix test

test-watch:
	mix test.watch

lint:
	mix credo
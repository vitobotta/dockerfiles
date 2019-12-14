# dockerfiles

## elixir-phoenix

To create a Phoenix 1.4.11 app (with Elixir 1.9.4):

```bash
mkdir hello
cd hello
docker run --rm -it -v ${PWD}:/opt/app:cached vitobotta/elixir-phoenix:1.9.4-1.4.11 mix phx.new /opt/app --module Hello
```

To run the app, first edit `config/config.exs` and make sure the app binds to 0.0.0.0:

```elixir
config :app, HelloWeb.Endpoint,
  ...,
  http: [ip: {0, 0, 0, 0}, port: 4000]
```

Then

```bash
docker run --rm -it -v ${PWD}:/opt/app:cached -p 4000:4000 vitobotta/elixir-phoenix:1.9.4-1.4.11 mix phx.server
```
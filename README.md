# Identicon

Module used to generate an avatar image (Identicon) based on the string provided

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `identicon` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:identicon, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/identicon](https://hexdocs.pm/identicon).

## Example

```
iex(1)> Identicon.main("banana")
:ok
```

This will generate a .png file (banana.png) with the Identicon generated.

![Example of Identicon](https://user-images.githubusercontent.com/51387597/109694936-f1d80b80-7b50-11eb-80cb-e599913ea472.png)

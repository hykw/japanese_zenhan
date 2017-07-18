# JapaneseZenhan

Elixir Library for converting Japanese characters between Full-width(Zen) and Half-width(Han). This was inspired by, and referenced [zenhan](https://pypi.python.org/pypi/zenhan) for Python.


## Installation

As the package is [available in Hex](https://hex.pm/packages/japanese_zenhan), you can install by adding `japanese_zenhan` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:japanese_zenhan, "~> 1.0.0"}]
end
```

## Usage
### Convert zenkaku to hankaku(only digit, alpha, both)
```
      iex> JapaneseZenhan.z2h("０0aａあ0")
      "00aaあ0"

      iex> JapaneseZenhan.z2h("０0aａあ0", [:digit])
      "00aａあ0"

      iex> JapaneseZenhan.z2h("０0aａあ0", [:alpha])
      "０0aaあ0"
```

### Convert hankaku to zenkaku(with/without option)
```
      iex> JapaneseZenhan.h2z("０0aａあ0")
      "００ａａあ０"

      iex> JapaneseZenhan.h2z("０0aａあ0", [:digit])
      "００aａあ０"
```


## LICENSE

This software is released under the MIT License, see LICENSE.

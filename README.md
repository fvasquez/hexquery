# HexQuery

A CLI tool for discovering Elixir/Erlang libraries on Hex

## Installation

HexQuery is an Elixir escript so it requires Mix to build and install.

```bash
$ git clone https://github.com/fvasquez/hexquery.git
$ cd hexquery
$ mix deps.get
$ mix escript.build
$ mix escript.install
```

## Usage

List all packages on Hex that depend on `circuits_i2c`.

```bash
$ hexquery dependents circuits_i2c
ads1115
atecc508a
hts221
```

Now search Hex for any packages that depend on `circuits_i2c` and contain "sensor" somewhere in their description.

```bash
$ hexquery dependents circuits_i2c --containing "sensor"
hts221
```

Replace "sensor" with any quoted search string you wish to filter the resulting package list by. The search only applies to the contents of the description field in the meta section of the package JSON.

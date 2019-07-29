# HexQuery

**A CLI tool for discovering Elixir/Erlang libraries on Hex**

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
atecc508a
ads1115
hts221
```

Scan all I2C buses for peripheral devices.

```bash
$ sudo hexquery i2c scan
i2c-1: 0xC0
```

Scanning detected a single device on bus `i2c-1` with an I2C address of `0xC0`.

Search Hex for any libraries that depend on `circuits_i2c` and include an I2C address of `0xC0` in their metadata.

```bash
$ hexquery i2c drivers 0xC0
atecc508a
```

The Microchip [ATECC508A](https://www.microchip.com/wwwproducts/en/ATECC508A) crypto element has an I2C address of `0xC0`. An Elixir interface for this element is published on Hex as [atecc508a](https://hex.pm/packages/atecc508a). Consult [the list](https://learn.adafruit.com/i2c-addresses/the-list) for the I2C addresses of most common sensors and modules.

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
atecc508a
ads1115
hts221
```

NOTE: The remaining examples are intended only for Nerves developers.

Install i2c-tools on your target embedded Linux system and scan all I2C buses for peripheral devices.

```bash
$ i2cdetect -y 1
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: 60 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --
```

Scanning bus `i2c-1` found a single peripheral device with an I2C address of `0x60`.

Now search Hex for any packages that depend on `circuits_i2c` and contain `0x60` somewhere in their description.

```bash
$ hexquery dependents circuits_i2c --containing "0x60"
atecc508a
```

The Microchip [ATECC508A](https://www.microchip.com/wwwproducts/en/ATECC508A) crypto element has an I2C address of `0x60`. An Elixir interface for this element is published on Hex as [atecc508a](https://hex.pm/packages/atecc508a). Consult [the list](https://learn.adafruit.com/i2c-addresses/the-list) for the I2C addresses of most common sensors and modules.

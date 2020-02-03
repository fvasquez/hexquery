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
$ hexquery --depends circuits_i2c
ads1115
atecc508a
breadboard
hdc_1000
hts221
ina219
mpl3115a2
oled
pca9641
sgp30
wafer
```

List all packages on Hex that depend on `circuits_i2c` with their descriptions.

```bash
$ hexquery --depends circuits_i2c --verbose
ads1115: Interact with ADS1115 Analog-to-Digital Chips
atecc508a: Elixir interface for the ATECC508A
breadboard: An helper library to 'breadboarding' with Elixir with a single-board computer using `Elixir Circuits`
hdc_1000: I2C interface to HDC1000 sensor
hts221: An Elixir library for working with the HTS221 sensor
ina219: Provides a driver for INA219-based voltage and current sensors connected via I2C
mpl3115a2: Driver for the MPL3115A2 altimeter connected via I2C.
oled: OLED is a library to manage the monochrome OLED screen based on chip SSD1306. Implements a Scenic driver but also set of graphic primitves to work standalone.
pca9641: Driver for PCA9641 2-channel I2C bus master arbiter chip
sgp30: Interface with SGP30 gas sensor in Elixir
wafer: Wafer is an Elixir library to make writing drivers for i2c and SPI connected peripherals and interacting with GPIO pins easier.
```

Package descriptions are stripped of newline symbols so that grepping output for search strings is easier.

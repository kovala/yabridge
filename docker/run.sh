#!/bin/sh
set -e

meson setup build --buildtype=release --cross-file=cross-wine.conf --unity=on --unity-size=1000
ninja -C build


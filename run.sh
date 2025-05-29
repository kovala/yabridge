#!/bin/sh
set -e

meson setup build-docker --buildtype=release --cross-file=cross-wine.conf --unity=on --unity-size=1000
meson compile -C build-docker -v
ninja -C build-docker



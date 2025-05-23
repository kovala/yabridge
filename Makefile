start:
	meson setup build --reconfigure --buildtype=release --cross-file=cross-wine.conf --unity=on --unity-size=1000
ninja:
	ninja -C build


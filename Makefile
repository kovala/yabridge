dc:=docker compose

in-start:
	meson setup build-docker --buildtype=release --cross-file=cross-wine.conf --unity=on --unity-size=1000
in-reconf:
	meson setup --reconfigure build-docker --buildtype=release --cross-file=cross-wine.conf --unity=on --unity-size=1000
in-ninja:
	ninja -C build-docker

start:
	meson setup build --reconfigure --buildtype=release --cross-file=cross-wine.conf --unity=on --unity-size=1000
ninja:
	ninja -C build
fix-owner:
	sudo chown $(USER):$(USER) -R subprojects || true
dn:
	$(dc) kill baker
	$(dc) down --remove-orphans
up:
	$(dc) up -d baker
baker:
	$(dc) exec baker bash

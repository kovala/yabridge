FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# Set up repositories needed for Wine and its development toolchain
RUN apt update && \
  apt install -y software-properties-common git wget && \
  dpkg --add-architecture i386 && \
  mkdir -pm755 /etc/apt/keyrings

RUN wget -O - https://dl.winehq.org/wine-builds/winehq.key | gpg --dearmor -o /etc/apt/keyrings/winehq-archive.key -

RUN wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources

RUN apt update && apt install -y --install-recommends winehq-devel wine-devel-dev && rm -rf /var/lib/apt/lists/*

RUN apt update && \
  apt install -y build-essential cmake pkg-config python3-pip pipx && \
  apt install -y libdbus-1-dev libxcb1-dev libxcb1-dev:i386 && \
  apt install -y gcc gcc-multilib g++ g++-multilib && \
  apt install -y fd-find exa && \
  pipx install meson && \
  pipx install ninja


WORKDIR /app

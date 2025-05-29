FROM debian:trixie-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    wget \
    gnupg \
    build-essential \
    pkg-config

# Set up repositories needed for Wine and its development toolchain
RUN apt update && \
  apt install -y git wget && \
  dpkg --add-architecture i386 && \
  mkdir -pm755 /etc/apt/keyrings

RUN wget -O - https://dl.winehq.org/wine-builds/winehq.key | gpg --dearmor -o /etc/apt/keyrings/winehq-archive.key -
RUN wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/trixie/winehq-trixie.sources

#RUN wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
#RUN echo "deb [signed-by=/etc/apt/keyrings/winehq-archive.key] https://dl.winehq.org/wine-builds/debian trixie main" | tee /etc/apt/sources.list.d/winehq.list

RUN apt update && apt install -y --install-recommends winehq-devel wine-devel-dev && rm -rf /var/lib/apt/lists/*

RUN apt update && \
  apt install -y build-essential cmake pkg-config python3-pip pipx 

RUN apt update && \
  apt install -y libdbus-1-dev libxcb1-dev libxcb1-dev:i386 && \
  apt install -y gcc g++

# RUN apt update && \
#   apt install -y build-essential cmake pkg-config python3-pip pipx && \
#   apt install -y libdbus-1-dev libxcb1-dev libxcb1-dev:i386 && \
#   apt install -y gcc gcc-multilib g++ g++-multilib

RUN apt install -y fd-find eza \
  && pipx install meson \
  && pipx install ninja

RUN apt install bash-completion

WORKDIR /app

FROM debian:bookworm-slim

# This Dockerfile is similar to the other image made for Ubuntu 18.04. See how
# this is used in the workflow files under
# https://github.com/robbert-vdh/yabridge/tree/master/.github/workflows

# dpkg might otherwise prompt us to select a timezoone while installing tzdata,
# even though we can't
ENV DEBIAN_FRONTEND=noninteractive

# Set up repositories needed for Wine and its development toolchain
RUN apt-get update && \
  apt-get install -y software-properties-common git wget && \
  dpkg --add-architecture i386 && \
  mkdir -pm755 /etc/apt/keyrings && \
  wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo gpg --dearmor -o /etc/apt/keyrings/winehq-archive.key - && \
  wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources

# Install Wine and its development headers
RUN apt-get update && \
  apt-get install -y --install-recommends winehq-devel wine-devel-dev && \
  rm -rf /var/lib/apt/lists/*

# Install the rest of the build dependencies
# We will default to GCC 10 to ensure that every build environment uses the same
# versions.
RUN apt-get update && \
  apt-get install -y build-essential cmake pkg-config python3-pip && \
  apt-get install -y libdbus-1-dev libxcb1-dev libxcb1-dev:i386 && \
  apt install -y gcc gcc-multilib g++ g++-multilib && \
  #    apt-get install -y gcc-10 gcc-10-multilib g++-10 g++-10-multilib && \
  #    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 110 --slave /usr/bin/g++ g++ /usr/bin/g++-10 && \
  pip3 install meson ninja


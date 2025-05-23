FROM ubuntu:focal
MAINTAINER Robbert van der Helm <mail@robbertvanderhelm.nl>

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
    wget -O - https://dl.winehq.org/wine-builds/winehq.key | apt-key add - && \
    add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' && \
    rm -rf /var/lib/apt/lists/*

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
    apt-get install -y gcc-10 gcc-10-multilib g++-10 g++-10-multilib && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 110 --slave /usr/bin/g++ g++ /usr/bin/g++-10 && \
    pip3 install meson ninja && \
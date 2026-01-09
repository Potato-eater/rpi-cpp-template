FROM debian:bullseye

RUN apt update && apt install -y \
    cmake \
    make \
    git \
    wget \
    gcc-aarch64-linux-gnu \
    g++-aarch64-linux-gnu \
    binutils-aarch64-linux-gnu

ENV CC=aarch64-linux-gnu-gcc
ENV CXX=aarch64-linux-gnu-g++

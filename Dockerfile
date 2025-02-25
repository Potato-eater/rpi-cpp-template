FROM debian:bullseye

# Install required dependencies
RUN apt update && apt install -y \
    cmake \
    make \
    gcc \
    g++ \
    git \
    wget \
    qemu-user-static \
    binutils-arm-linux-gnueabihf \
    g++-arm-linux-gnueabihf \
    gcc-arm-linux-gnueabihf

# Set environment variables for cross-compilation
ENV CC=arm-linux-gnueabihf-gcc
ENV CXX=arm-linux-gnueabihf-g++

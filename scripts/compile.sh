#!/bin/bash

set -e  # Exit immediately on error

# Define variables
IMAGE_NAME="rpi-cross-compiler"
WORKSPACE="/workspace"
OUTPUT_BINARY="cool_program"

# Fix path conversion issue in Git Bash
export MSYS_NO_PATHCONV=1

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Error: Docker is not installed or not in PATH."
    exit 1
fi

# Build the Docker image if it doesn't exist
if [[ -z "$(docker images -q $IMAGE_NAME 2>/dev/null)" ]]; then
    echo "Docker image not found. Building it..."
    docker build -t $IMAGE_NAME .
fi

# Run the Docker container and compile the project
docker run --rm -v "$(pwd)":$WORKSPACE $IMAGE_NAME bash -c "
    set -e  # Ensure the container exits on errors
    ls -l $WORKSPACE  # List contents for debugging
    [ -d $WORKSPACE ] || { echo 'Error: Workspace not found'; exit 1; }
    cd $WORKSPACE
    cmake -B build  # Generate build files in 'build/' directory
    cmake --build build  # Compile the project
"

# Check if the binary was created
if [[ -f "build/$OUTPUT_BINARY" ]]; then
    echo "✅ Compilation successful! Binary: build/$OUTPUT_BINARY"
else
    echo "❌ Compilation failed!"
    exit 1
fi

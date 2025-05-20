#!/bin/bash
# Uncomment to help debug when build issues arise when running build script
set -ex

# @TODO I started to get carried away with the build script, wanted to make it easy to use as possible

# Define build type (Debug or Release)
BUILD_TYPE="Debug"
# Other configurations
BINARY_NAME="hw1_app"

sudo chown -R $USER:$USER .

build()
{
    # This folder should be ignored in CI and should be on the local filesystem ONLY anyways.
    mkdir -p build/tmp
    mkdir -p build/bin
    mkdir -p build/lib

    # Resolve absolute path to build/bin. This is where we want the final binary to go. All other
    # intermediate file will go into build/temp
    OUTPUT_BIN_DIR="$(cd "$(dirname "$0")/build/bin" && pwd)"

    # Enter build/tmp as the build directory
    cd build/tmp

    # Configure with CMake: source dir is ../.. (project root)
    cmake ../.. -DCMAKE_RUNTIME_OUTPUT_DIRECTORY="$OUTPUT_BIN_DIR" \
                -DCMAKE_LIBRARY_OUTPUT_DIRECTORY="$OUTPUT_LIB_DIR"

    # Run CMake to generate build files
    cmake -DCMAKE_BUILD_TYPE=$BUILD_TYPE ../..

    # Build the project
    cmake --build . --verbose

    # Return to the original directory
    cd ..
}

clean()
{
    # Remove build folder if it exists
    if [ -d "build" ]; then
        echo "Cleaning existing build directory..."
        rm -rf build
    fi
}

run() {
    echo "Running the binary..."
    if [ -f "./build/bin/$BINARY_NAME" ]; then
        "./build/bin/$BINARY_NAME"
    else
        echo "Error: Binary './build/bin/$BINARY_NAME' not found. Run './build.sh build' first."
        exit 1
    fi
}

usage()
{
    echo "Usage: $0 [clean] [build] [run]"
    echo "Example: $0 clean build run"
    exit 1
}

# -------------------------
# Main
# -------------------------

if [ $# -eq 0 ]; then
    usage
fi

for cmd in "$@"; do
    case "$cmd" in
        clean) clean ;;
        build) build ;;
        run)   run ;;
        *)     echo "Unknown command: $cmd"; usage ;;
    esac
done
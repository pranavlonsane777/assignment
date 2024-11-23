#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e
# Define variables
OUTPUT_FILE="function.zip"
SOURCE_DIR="."
# Create a clean directory for dependencies
echo "Setting up build environment..."
rm -rf build
mkdir build

# Install Python dependencies into the build directory
echo "Installing dependencies..."
pip install -r requirements.txt -t build

# Copy the Python function code to the build directory
echo "Copying source files..."
cp ${SOURCE_DIR}/*.py build/

# Package the code and dependencies into a zip file
echo "Packaging function..."
cd build
zip -r "../${OUTPUT_FILE}" .

# Clean up the build directory
cd ..
rm -rf build

echo "Build complete. Packaged as ${OUTPUT_FILE}."

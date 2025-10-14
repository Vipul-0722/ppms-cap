# # # Replace with your registry URL
# export DOCKER_REGISTRY="vipul710"

# # docker build -t $DOCKER_REGISTRY/my-bookshop:latest .
# # docker push $DOCKER_REGISTRY/my-bookshop:latest

# docker buildx build --no-cache --platform linux/amd64,linux/arm64 -t $DOCKER_REGISTRY/my-bookshop:latest --push .



#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e

# 1. Configuration
# Your Docker registry
export DOCKER_REGISTRY="vipul710"
# The name for your application's image
export IMAGE_NAME="my-bookshop"
# A unique version for this build
export VERSION=$(uuidgen | tr '[:upper:]' '[:lower:]' | cut -d'-' -f1)

echo "---"
echo "Registry:    $DOCKER_REGISTRY"
echo "Image Name:  $IMAGE_NAME"
echo "Build Tag:   $VERSION"
echo "---"

# 2. Clean up previous build artifacts
echo "Cleaning up previous build..."
find . -name '.DS_Store' -type f -delete
# No need to delete gen/, as we are not using it

# 3. Build a single container image for the application
# pack will read package.json, install dependencies (including dev), and set the start command.
echo "Building Docker image for the application..."
pack build "$DOCKER_REGISTRY/$IMAGE_NAME:$VERSION" \
  --builder paketobuildpacks/builder-jammy-base \
  --path . \
  --clear-cache \
  --env NPM_CONFIG_PRODUCTION=false

# 4. Push the container image to the registry
echo "Pushing application image to registry..."
docker push "$DOCKER_REGISTRY/$IMAGE_NAME:$VERSION"

echo "---"
echo "Build and push completed successfully!"
echo "---"
#!/bin/bash

set -e

unset GOROOT

IMAGE=$1
TAG=$2
DIR=$3

if [ -z "$IMAGE" ]; then
  echo 'Required image name parameter'
  exit 1
fi

if [ -z "$TAG" ]; then
  echo 'INFO: Image tag parameter not present. Defaulting to latest'
  TAG="latest"
fi

if [ -z "$DIR" ]; then
  echo 'INFO: dirPath parameter not present. Defaulting PWD'
  DIR="$(pwd)"
fi

if [ -z "$RELEASE_VERSION" ]; then
  echo 'INFO: operator-sdk release version is not set. Defaulting to v0.11.0'
  RELEASE_VERSION="v0.11.0"
fi

curl -L -o /operator-sdk "https://github.com/operator-framework/operator-sdk/releases/download/${RELEASE_VERSION}/operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu"

chmod +x /operator-sdk

cd "$DIR" || exit 1

/operator-sdk build "$IMAGE:$TAG" --image-builder="docker"

echo ::set-output name=image::"$IMAGE:$TAG"
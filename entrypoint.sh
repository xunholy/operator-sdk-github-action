#!/bin/bash

IMAGE=$1
TAG=$2

if [ -z "$IMAGE" ]; then
  echo 'Required image name parameter'
  exit 1
fi

if [ -z "$TAG" ]; then
  echo 'INFO: Image tag parameter not present. Defaulting to latest'
  TAG="latest"
fi

/home/default/operator-sdk-v0.11.0-x86_64-linux-gnu build "$IMAGE:$TAG" --image-builder="docker"

echo ::set-output name=image::"$IMAGE:$TAG"
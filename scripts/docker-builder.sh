#!/usr/bin/env bash
set -e

docker buildx build -t xplayer-builder .  --no-cache --network=host

#!/usr/bin/env bash
set -e

docker run --rm -it -v "$PWD:/work" xplayer-builder ./scripts/build-deb.sh
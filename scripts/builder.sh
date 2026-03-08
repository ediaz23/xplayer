#!/usr/bin/env bash
set -e

docker run --rm -it -v "$PWD:/work" -w /work xplayer-builder "$@"

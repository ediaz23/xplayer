#!/usr/bin/env bash
set -e

# docker run --rm -it -v "$PWD:/work" xplayer-builder "$@"
docker run --rm -it -v "$PWD:/work" xplayer-builder ./autogen.sh
docker run --rm -it -v "$PWD:/work" xplayer-builder make CFLAGS="-Wno-error -Wno-deprecated-declarations \
    -Wno-incompatible-pointer-types"
docker run --rm -it -v "$PWD:/work" xplayer-builder glib-compile-schemas /work/data
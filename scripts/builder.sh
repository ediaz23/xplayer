#!/usr/bin/env bash
set -e

# docker run --rm -it -v "$PWD:/work" xplayer-builder "$@"
[ -f ./Makefile ] && docker run --rm -it -v "$PWD:/work" xplayer-builder make clean
rm -rf bin autom4te.cache build-aux debian/tmp debian/files Makefile
docker run --rm -it -v "$PWD:/work" xplayer-builder ./autogen.sh
docker run --rm -it -v "$PWD:/work" xplayer-builder make CFLAGS="-Wno-error -Wno-deprecated-declarations \
    -Wno-incompatible-pointer-types"
docker run --rm -it -v "$PWD:/work" xplayer-builder glib-compile-schemas /work/data

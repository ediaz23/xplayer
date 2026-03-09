#!/usr/bin/env bash
set -e
mkdir -p /work/bin
rm -f /tmp/building
mkdir -p /tmp/building/
cp -av /work /tmp/building/work
cd /tmp/building/work
dpkg-buildpackage -us -uc -b
mv ../*.deb /work/bin/
echo "builded"
ls /work/bin/

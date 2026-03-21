#!/usr/bin/env bash
set -e

sudo apt install --reinstall \
    ./bin/gir1.2-xplayer-1.0_2.4.4_amd64.deb \
    ./bin/libxplayer0_2.4.4_amd64.deb \
    ./bin/xplayer_2.4.4_amd64.deb \
    ./bin/xplayer-common_2.4.4_all.deb \
    ./bin/xplayer-plugins_2.4.4_amd64.deb \
    ./bin/xplayer-plugins-extra_2.4.4_amd64.deb \
    ./bin/xplayer-thumbnailer_2.4.4_amd64.deb

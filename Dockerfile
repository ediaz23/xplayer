FROM gcc:11-bullseye

RUN apt-get update 
RUN apt-get install -y --no-install-recommends \
    pkg-config autoconf automake autoconf-archive cmake meson ninja-build make \
    libtool \
    gettext \
    intltool \
    python3 \
    gtk-doc-tools \
    yelp-tools \
    itstool \
    libglib2.0-dev \
    libgtk-3-dev \
    libgirepository1.0-dev \
    gobject-introspection \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    gstreamer1.0-tools \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    libclutter-1.0-dev \
    libclutter-gtk-1.0-dev \
    libdbus-1-dev \
    libxapp-dev \
    libpeas-dev \
    libxml2-dev \
    libx11-dev \
    libsm-dev \
    libice-dev libzeitgeist-2.0-dev \
    libsoup2.4-dev ibquvi-0.9-dev libarchive-dev libgcrypt20-dev libgmime-3.0-dev \
    dpkg-dev debhelper build-essential fakeroot devscripts cdbs gnome-pkg-tools libsoup-gnome2.4-dev libglib2.0-doc \
    gnome-icon-theme gstreamer1.0-plugins-base-apps libbluetooth-dev libgdata-dev libgdk-pixbuf2.0-dev libxxf86vm-dev \
    valac \
    libpython3-dev \
    python3-gi \
    pylint \
    libgrilo-0.3-dev \
    liblircclient-dev \
    python3-gi \
    python-gi-dev \
    libclutter-gst-3.0-dev \
    gsettings-desktop-schemas-dev
RUN apt-get install sudo passwd 

COPY libs/ /tmp/libs/

RUN ls /tmp/libs/*.deb >/dev/null 2>&1 && apt install -f -y /tmp/libs/*.deb 
RUN rm -f /tmp/libs/*.deb
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /work

RUN useradd -m -s /bin/bash xplayerbuilder
RUN usermod -aG sudo xplayerbuilder
RUN echo 'xplayerbuilder:123456' | chpasswd
USER xplayerbuilder

CMD ["bash"]

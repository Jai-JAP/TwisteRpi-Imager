#!/bin/bash
# Automated script to install RPi-Imager
VER=1.6.2
ARCH=$( dpkg --print-architecture )

if [ ! -e /usr/bin/rpi-imager ]; then
    echo "RPi-Imager not installed, installing it."
    if [ ! $ARCH == armhf ] || [ ! $ARCH == arm64 ] || [ ! $ARCH == i386 ] || [ ! $ARCH == amd64 ] ; then
        echo "Unsupported architecture ${ARCH}"
    fi
    wget -O /tmp/rpi-imager.deb http://archive.raspberrypi.org/debian/pool/main/r/rpi-imager/rpi-imager_${VER}_${ARCH}.deb
    apt-get install /tmp/rpi-imager.deb
    rm /tmp/rpi-imager.deb
    exit 0
else
    echo "RPi-Imager is installed, continuing..."
    exit 0
fi
#!/bin/bash

set -e

build/autogen.sh

./configure --prefix=/data/usr \
    --enable-bsdtar=static \
    --disable-bsdcat \
    --disable-bsdcpio \
    --disable-bsdunzip \
    --without-xml2 \
    --without-nettle \
    --disable-shared \
    CC=musl-gcc \
    LDFLAGS='--static'

make -j$(nproc)

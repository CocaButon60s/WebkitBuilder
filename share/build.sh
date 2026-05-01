#!/bin/bash

set -e

(
    #for libwpe
    LIBWPE=libwpe-1.16.3
    if [ -d ${LIBWPE} ];then
        exit 0
    fi
    wget https://wpewebkit.org/releases/${LIBWPE}.tar.xz
    tar xvf ${LIBWPE}.tar.xz
    rm ${LIBWPE}.tar.xz
    cd ${LIBWPE}
    cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -GNinja
    ninja
    sudo ninja install
    sudo ldconfig
)
(
    # for wpebackend-fdo
    WPEBACKEND_FDO=wpebackend-fdo-1.16.1
    if [ -d ${WPEBACKEND_FDO} ];then
        exit 0
    fi
    wget https://wpewebkit.org/releases/${WPEBACKEND_FDO}.tar.xz
    tar xvf ${WPEBACKEND_FDO}.tar.xz
    rm ${WPEBACKEND_FDO}.tar.xz
    cd ${WPEBACKEND_FDO}
    meson setup build
    ninja -C build
    sudo ninja -C build install
    sudo ldconfig
)
(
    # for woff2
    if [ -d woff2 ];then
        exit 0
    fi
    git clone --recursive https://github.com/google/woff2.git
    cd woff2
    mkdir -p out
    cd out
    cmake ..
    make
    sudo make install
    sudo ldconfig
)
(
    # for libxslt
    VERSION=v1.1.43
    LIBXSLT=libxslt-${VERSION}
    if [ -d ${LIBXSLT} ];then
        exit 0
    fi
    wget https://gitlab.gnome.org/GNOME/libxslt/-/archive/${VERSION}/${LIBXSLT}.tar.gz
    tar xvf ${LIBXSLT}.tar.gz
    rm ${LIBXSLT}.tar.gz
    cd ${LIBXSLT}
    ./autogen.sh
    make
    sudo make install
    sudo ldconfig
)
(
    # for libbacktrace
    if [ -d libbacktrace ];then
        exit 0
    fi
    git clone https://github.com/ianlancetaylor/libbacktrace.git --depth 1
    cd libbacktrace
    ./configure
    make
    sudo make install
    sudo ldconfig
)
(
    # for wpewebkit
    WPEWEBKIT=wpewebkit-2.52.3
    if [ -d ${WPEWEBKIT} ];then
        exit 0
    fi
    wget https://wpewebkit.org/releases/${WPEWEBKIT}.tar.xz
    tar xvf ${WPEWEBKIT}.tar.xz
    rm ${WPEWEBKIT}.tar.xz
    cd ${WPEWEBKIT}
    cmake -DPORT=WPE -DCMAKE_BUILD_TYPE=RelWithDebInfo -GNinja
    ninja
    sudo ninja install
    sudo ldconfig
)

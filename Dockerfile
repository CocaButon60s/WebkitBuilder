FROM ubuntu:24.04

COPY <<EOF /etc/sudoers.d/ubuntu
ubuntu ALL=(ALL) NOPASSWD:ALL

EOF

RUN <<EOF
apt-get update
apt-get install -y wget sudo neovim cmake git
EOF

# for libwpe
RUN apt-get install -y libegl1-mesa-dev libgles2-mesa-dev libxkbcommon-dev

# for wpebackend-fdo
RUN apt-get install -y meson ninja-build libwayland-dev libepoxy-dev libglib2.0-dev

# for woff2
RUN apt-get install -y libbrotli-dev

# for lixslt
RUN apt-get install -y libxml2-dev autoconf libtool

# for libbacktrace
RUN apt-get install -y \
    g++ \
    gcc \
    libatk-bridge2.0-dev \
    libcairo2-dev \
    libgbm-dev \
    libgnutls28-dev \
    libharfbuzz-dev \
    libicu-dev \
    libxml2-dev \
    pkg-config \
    qt6-declarative-private-dev \
    unifdef \
    wayland-protocols \
    zlib1g-dev \
    libopenxr-dev \
    python3-psutil \
    libegl-mesa0 \
    libmount-dev \
    libopus-dev \
    libpulse-dev \
    libsrtp2-dev \
    libtheora-dev \
    libvorbis-dev \
    libvpx-dev \
    libxcb-glx0-dev \
    libxcb-xkb-dev \
    libxkbcommon-dev \
    libxrandr-dev \
    libxcb-cursor-dev \
    libportal-dev \
    libportal-gtk4-dev

RUN apt-get install -y \
    libgcrypt20-dev \
    libgpg-error-dev \
    libsoup-3.0-dev \
    gobject-introspection \
    flite1-dev \
    libjxl-dev \
    libhyphen-dev \
    libavif-dev \
    libsystemd-dev \
    libdrm-dev \
    libseccomp-dev \
    bubblewrap \
    xdg-dbus-proxy \
    gperf \
    ruby

RUN apt-get install -y \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    libgstreamer-plugins-bad1.0-dev \
    libgstreamer-plugins-good1.0-dev \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    gstreamer1.0-gl \
    gstreamer1.0-gtk3 \
    gstreamer1.0-pulseaudio

RUN apt-get install -y python3-pip python3-venv pipx
USER ubuntu
RUN pipx install gi-docgen

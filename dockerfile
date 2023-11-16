FROM ubuntu:jammy

RUN apt update
RUN dpkg --add-architecture i386 \
    && apt update

RUN apt install -y \
        git \
        flex \
        bison \
        build-essential \
        gcc-multilib \
        gcc-mingw-w64 \ 
        libasound2-dev \ 
        libpulse-dev \ 
        libdbus-1-dev \ 
        libfontconfig-dev \ 
        libfreetype-dev \ 
        libgnutls28-dev \ 
        libgl-dev \ 
        libunwind-dev \ 
        libx11-dev \ 
        libxcomposite-dev \ 
        libxcursor-dev \ 
        libxfixes-dev \ 
        libxi-dev \ 
        libxrandr-dev \ 
        libxrender-dev \ 
        libxext-dev \ 
        libgstreamer1.0-dev \
        libgstreamer-plugins-base1.0-dev \ 
        libosmesa6-dev \ 
        libsdl2-dev \ 
        libudev-dev \ 
        libvulkan-dev \ 
        libcapi20-dev \ 
        libcups2-dev \ 
        libgphoto2-dev \ 
        libsane-dev \ 
        libkrb5-dev \ 
        samba-dev \ 
        ocl-icd-opencl-dev \ 
        libpcap-dev \ 
        libusb-1.0-0-dev \ 
        libv4l-dev \ 
        libxxf86vm-dev \ 
        libxinerama-dev

RUN apt install -y \
        libx11-dev:i386 \
        libfreetype-dev:i386

RUN git clone https://gitlab.winehq.org/wine/wine.git /wine-dirs/wine-source
RUN mkdir -p /wine-dirs/wine32 && mkdir -p /wine-dirs/wine64

RUN cd /wine-dirs/wine64 \
    && ../wine-source/configure \
        CFLAGS="-O3 -pipe -fstack-protector-strong" \
        --enable-win64 \
    && make -j$(nproc)

RUN cd /wine-dirs/wine32 \
    && PKG_CONFIG_PATH=/usr/lib/pkgconfig ../wine-source/configure \
        CFLAGS="-O3 -pipe -fstack-protector-strong" \
        --with-wine64=../wine64 \
    && make -j$(nproc)

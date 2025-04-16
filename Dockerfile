FROM ubuntu:24.10

WORKDIR /src

RUN apt update \
  && apt upgrade --yes

RUN apt install --yes \
  git \
  meson \
  libgcrypt-dev \
  libgnutls28-dev \
  libusbmuxd-dev \
  libimobiledevice-dev \
  libunistring-dev \
  libzstd-dev

RUN git clone "https://github.com/jeremy-code/Jitterbug.git" \
  && cd Jitterbug \
  && git submodule update --init --recursive \
  && meson setup build \
  && cd build \
  && ninja \
  && ninja install

WORKDIR /src/Jitterbug/build

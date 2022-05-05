#!/bin/bash

OPM_VER="2021.10"
FMT_VER="7.0.3"
URL="https://github.com/fmtlib/fmt/releases/download/${FMT_VER}/fmt-${FMT_VER}.zip"
PREFIX="{$HOME}/opm-${OPM_VER}"

if [[ ! -d fmt-${FMT_VER} ]]; then
    if [[ ! -f fmt-${FMT_VER}.zip ]]; then
      wget "${URL}"
    fi
    unzip fmt-${FMT_VER}.zip
fi
cd fmt-${FMT_VER}
cmake -S . -B build -D CMAKE_INSTALL_PREFIX=${PREFIX}/fmt -G Ninja -Wno-dev && \
  cmake --build build && \
  cmake --install build

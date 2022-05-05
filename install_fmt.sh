#!/bin/bash

OPM_VER="2021.10"
FMT_VER="7.0.3"
URL="https://github.com/fmtlib/fmt/releases/download/${FMT_VER}/fmt-${FMT_VER}.zip"
PREFIX="{$HOME}/opm-${OPM_VER}"

###################################################
# Print help messages.
# Globals.
#   None
# Arguments:
#   None
###################################################
function print_help() {
  echo "Usage: ./install-fmt.sh [-h] [--prefix PATH]"
  echo ""
  echo "Install fmt library."
  echo ""
  echo "Options:"
  echo "  -h, --help      Print help messages."
  echo "  --prefix        Specify the install prefix path."
  echo "                  The default path is $HOME/opm-$version."
}

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)
      print_help
      exit 0
      ;;
    --prefix)
      PREFIX="$2"
      shift
      shift
      ;;
    -*|--*)
      echo "Unknown option: $1"
      exit 1
      ;;
    *)
      shift
      ;;
  esac
done

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

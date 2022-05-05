#!/bin/bash

VERSION="2021.10"
PREFIX="${HOME}/opm-${VERSION}"
MODULE_NAMES=("common" "material" "grid" "models" "simulators" "upscaling")
MPI_SUPPORT="OFF"

###################################################
# Check if a given string is a correct module name.
# Globals:
#   MODULE_NAMES
# Arguments:
#   A module name
###################################################
function check_module_name() {
  for name in ${MODULE_NAMES[@]}; do
    if [[ "${name}" == "$1" ]]; then
      return 0
    fi
  done
  echo "Unknown module name: $name"
  exit 1
}

###################################################
# Print help messages.
# Globals.
#   None
# Arguments:
#   None
###################################################
function print_help() {
  echo "Usage: ./install-opm.sh [-h] [--prefix PATH] {common,material,grid,"
  echo "       models,simulators,upscaling}"
  echo ""
  echo "Install OPM modules."
  echo "Any number of module names can be passed. For example,"
  echo "$ ./install-opm.sh common material grid"
  echo "All modules will be built and installed if no module name is"
  echo "specified."
  echo ""
  echo "Positional arguments:"
  echo "  common          Install opm-common."
  echo "  material        Install opm-material."
  echo "  grid            Install opm-grid."
  echo "  models          Install opm-models."
  echo "  simulators      Install opm-simulators."
  echo "  upscaling       Install opm-upscaling."
  echo ""
  echo "Options:"
  echo "  -h, --help      Print help messages."
  echo "  --prefix        Specify the install prefix path."
  echo "                  The default path is $HOME/opm-$version."
  echo "  --use-mpi       Build with MPI support."
}

#####################################################
# Install an OPM module
# Globals:
#   PREFIX 
# Arguments:
#   A module name
#####################################################
function install_opm_module() {
  local readonly module="$1"
  cd opm-${module}
  cmake -S . -B build \
      -DCMAKE_INSTALL_PREFIX=${PREFIX}/opm-${module} \
      -DCMAKE_PREFIX_PATH=${PREFIX} \
      -DUSE_MPI=${MPI_SUPPORT} \
      -DCMAKE_CXX_FLAGS="-Wno-cast-function-type" \
      -DSIBLING_SEARCH=OFF \
      -GNinja \
      -Wno-dev && \
    cmake --build build && \
    cmake --install build
}

# Parse arguments
modules=()
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
    --use-mpi)
      MPI_SUPPORT="ON"
      shift
      ;;
    -*|--*)
      echo "Unknown option: $1"
      exit 1
      ;;
    *)
      modules+=("$1")
      check_module_name "$1"
      shift
      ;;
  esac
done

if [[ ${#modules[@]} -eq 0 ]]; then
  modules=("${MODULE_NAMES[@]}")
fi

for module in ${modules[@]}; do
  install_opm_module "${module}"
done

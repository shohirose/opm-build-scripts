#!/bin/bash
#
# Install prerequisites for OPM modules

# Packages necessary for building
sudo apt install -y build-essential gfortran pkg-config cmake ninja-build

# Packages necessary for documentation
sudo apt install -y doxygen ghostscript texlive-latex-recommended gnuplot

# Packages necessary for version control
sudo apt install -y git-core

# MPI
sudo apt install -y mpi-default-dev libptscotch-dev libparmetis-dev

# Prerequisites
sudo apt install -y libblas-dev libboost-all-dev libsuitesparse-dev libtrilinos-zoltan-dev

# Dune modules
sudo apt install -y libdune-common-dev libdune-geometry-dev libdune-istl-dev libdune-grid-dev

# Optional packages
sudo apt install -y libcjson-dev cppcheck clang-tools

# For opm-models
sudo apt install -y libgmp-dev valgrind libtbb-dev

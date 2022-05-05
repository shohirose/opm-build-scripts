#!/bin/bash
#
# Install prerequisites for OPM modules

sudo apt install -y build-essential gfortran pkg-config cmake
sudo apt install -y doxygen ghostscript texlive-latex-recommended gnuplot
sudo apt install -y git-core
sudo apt install -y mpi-default-dev libptscotch-dev
sudo apt install -y libblas-dev libboost-all-dev libsuitesparse-dev libtrilinos-zoltan-dev
sudo apt install -y libdune-common-dev libdune-geometry-dev libdune-istl-dev libdune-grid-dev
sudo apt install -y libcjson-dev cppcheck clang-tools
# opm-models
sudo apt install -y libgmp-dev valgrind libtbb-dev

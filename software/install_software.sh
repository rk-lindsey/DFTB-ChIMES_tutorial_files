#!/bin/bash

# This is run from DFTB-ChIMES_tutorial_files/software
# User should `conda activate chimes` first

# Install chimes_lsq and dlars

git clone https://github.com/rk-lindsey/chimes_lsq.git
cd chimes_lsq
./install.sh # Say yes/accept at all prompts. You will get some error messages
cd - 
cp Makefile.dlars.dftbplus_school chimes_lsq/contrib/dlars/src/Makefile
cp chimes_lsq.py chimes_lsq/build # This version adds mpirun as a mpistyle option
cd chimes_lsq/contrib/dlars/src
export OMPI_CXX=$(which $CXX)
make
cd -

# Install the AL_Driver

git clone https://github.com/rk-lindsey/al_driver.git
cd al_driver
git checkout dftbplus_features


# Install Travis .. use a try/except like construction for machines w/o wget

if ! wget http://www.travis-analyzer.de/files/travis-src-220729.tar.gz; then
    echo "wget failed or is not installed. Trying curl..."
    curl -LO http://www.travis-analyzer.de/files/travis-src-220729.tar.gz
fi

tar -xvf travis-src-220729.tar.gz
cd travis-src-220729
make
cd -

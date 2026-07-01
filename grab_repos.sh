#!/bin/bash

# Install Travis - this is used to compute the RDFs .. takes about 1 minutes
echo "Installing Travis analyzer for RDF generation"
wget http://www.travis-analyzer.de/files/travis-src-220729.tar.gz
tar -xvf travis-src-220729.tar.gz 
cd travis-src-220729
time make -j4
cd -

# Grab ChIMES repos... takes about 5 minutes 
echo "Grabbing ChIMES LSQ and ALD repositories..."
time git clone https://github.com/rk-lindsey/chimes_lsq.git # Right now, still relies on feature branch dftbplus_features
	cd chimes_lsq
	git checkout fixes_for_dftb+_and_conda
	cd -
time git clone https://github.com/rk-lindsey/al_driver.git  # Right now, still relies on feature branch fixes_for_dftb+_and_conda
	cd al_driver
	git checkout dftbplus_features
	cd -

# Install ChIMES_LSQ. Since this is not a recognized system, need to compile dlars manually
export hosttype=CONDA
cd chimes_lsq
./install.sh
cd -


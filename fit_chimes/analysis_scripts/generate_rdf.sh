#!/bin/bash

# Add box lengths to the .xyz file 
awk '/MD iter/{print("10.01589937 10.01589937 10.01589937")}!/MD iter/{print}' geo_end.xyz > geo_end-wboxl.xyz

# Calculate the RDF using Travis
../travis-src-220729/exe/travis -p geo_end-wboxl.xyz -i rdf.in 

# Plot the RDFs
gnuplot gnuplot_rdf.script

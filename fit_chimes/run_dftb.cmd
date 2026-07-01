#!/bin/bash
#SBATCH -J ALC-1-md-c0-i0
#SBATCH -N 1
#SBATCH --ntasks-per-node 1
#SBATCH -t 10:00:00
#SBATCH -p pbatch
#SBATCH -A iap
#SBATCH -V 
#SBATCH -o stdoutmsg
export OMP_NUM_THREADS=4 OMP_PLACES=cores OMP_PROC_BIND=close
srun -n 1 /usr/WS2/lindsey11/dftb_tests/dftbplus/installation/bin/dftb+ > dftb.out

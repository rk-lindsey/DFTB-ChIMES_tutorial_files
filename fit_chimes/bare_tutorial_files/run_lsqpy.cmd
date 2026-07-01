#!/bin/bash
#SBATCH -J ALC-1-lsq-2
#SBATCH -N 1
#SBATCH --ntasks-per-node 8
#SBATCH -t 00:30:00
#SBATCH -p pdebug
#SBATCH -A iap
#SBATCH -V 
#SBATCH -o stdoutmsg
module load intel-classic/2021.6.0-magic mvapich2/2.3.7 mkl


exe="python3 /usr/WS2/lindsey11/dftb_tests/chimes_lsq/src/../build/chimes_lsq.py"

time $exe --weights weights.dat --algorithm dlasso --alpha 1.0E-7 --normalize True --nodes 1 --cores 8 --mpistyle srun --split_files False | tee params.txt 

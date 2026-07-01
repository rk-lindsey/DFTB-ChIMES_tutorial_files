#!/bin/bash


# FYI, the AL_Driver equivalent of these files is:
#
# b-labeled_DFT.txt   : ALC-*/b-labeled_full.traj_file_idx-0.dat
# b-labeled_DFTB.txt  : ALC-*/b-labeled_subtracted..traj_file_idx-0.dat
# b-labeled.txt       : ALC-*/GEN_FF/b-labeled_comb.txt
# force.txt           : ALC-*/GEN_FF/force.txt


# What we're starting with: DFT vs DFTB
paste b-labeled_DFT.txt b-labeled_DFTB.txt > compare_all_DFTvsDFTB.txt

# What we're trying to fit ChIMES to: DFT-DFTB vs ChIMES
paste b-labeled.txt force.txt > compare_all_DFT-DFTBvsChIMES.txt

# Our target final prodcut: DFT vs DFTB+ChIMES
paste b-labeled_DFT.txt b-labeled_DFTB.txt force.txt | awk '{print($1, $2, $4+$5)}' > compare_all_DFTvsDFTB+ChIMES.txt

# Now let's break these up into force, energy, and stress. Units will be in terms of kcal/mol, Angstrom


awk '/N/ {print($2,$4)}' compare_all_DFTvsDFTB.txt > compare_F_DFTvsDFTB.txt
awk '/s/ {print($2,$4)}' compare_all_DFTvsDFTB.txt > compare_S_DFTvsDFTB.txt
awk '/+1/{print($2,$4)}' compare_all_DFTvsDFTB.txt > compare_E_DFTvsDFTB.txt

for i in DFT-DFTBvsChIMES DFTvsDFTB+ChIMES
do
	awk '/N/ {print($2,$3)}' compare_all_${i}.txt > compare_F_${i}.txt
	awk '/s/ {print($2,$3)}' compare_all_${i}.txt > compare_S_${i}.txt
	awk '/+1/{print($2,$3)}' compare_all_${i}.txt > compare_E_${i}.txt
done

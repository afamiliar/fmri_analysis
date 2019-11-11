#!/bin/bash
#
#	Run FSL feat design files

for d in data/subj*/ ; do
# for d in "data/subj01" ; do

	cd $d

	feat design_r1.fsf
	feat design_r2.fsf
	feat design_r3.fsf
	feat design_r4.fsf
	feat design_r5.fsf

	cd ../

	echo $d	
done
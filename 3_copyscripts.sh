#!/bin/bash
#
#	Copy FSL feat design files and replace subject-specific string

for d in data/subj*/ ; do
# for d in "data/subj01" ; do

	cd $d
	
	SUBJ=${PWD##*/}

	# main analysis files

	cp ../../design_files/*.fsf .

	thisstr='s/subj01/'$SUBJ'/g;'

	perl -pi -w -e $thisstr design_r1.fsf
	perl -pi -w -e $thisstr design_r2.fsf
	perl -pi -w -e $thisstr design_r3.fsf
	perl -pi -w -e $thisstr design_r4.fsf
	perl -pi -w -e $thisstr design_r5.fsf

	cd ..
 		 	
 	echo $d
	
done
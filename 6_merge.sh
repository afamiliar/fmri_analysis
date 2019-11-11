#!/bin/sh 
#
#	Merge stat files into one file per run, then merge files across runs

for d in data/subj*/ ; do
# for d in "data/subj01" ; do

	cd $d

  	for r in {1..5} ; do
  
	  cd run$r.feat/stats
  
		fslmerge -t tstat_r$r tstat1_reg tstat2_reg tstat3_reg tstat4_reg tstat5_reg tstat6_reg tstat7_reg tstat8_reg tstat9_reg
		mv tstat_r$r'.nii.gz' ../..

	  cd ../..
	  
	done

	fslmerge -t tstat_all tstat_r1 tstat_r2 tstat_r3 tstat_r4 tstat_r5

	rm *_r*

	cd ../..

	echo $d

done

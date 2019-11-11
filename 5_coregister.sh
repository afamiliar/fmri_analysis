#!/bin/sh 
#
#	Register EPI results to anatomical
#	(depending on FSL version, registration will be calculated but not performed)

for d in data/subj*/ ; do
# for d in "data/subj01" ; do

  cd $d
  
  for r in {1..5} ; do
  
	  cd run$r.feat/stats
  
		for f in {1..9} ; do
			flirt -in tstat$f'.nii.gz' \
				-ref ../../nii/anatomical_brain \
				-applyxfm -init ../reg/example_func2highres.mat \
				-out tstat$f'_reg'
		done
	
  	  cd ../..
  
   done
  
  cd ..
  
  echo $d
  
done 

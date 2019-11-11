#!/bin/sh 
#
#	Create backup and set up files for processing

for d in data/subj*/ ; do
# for d in "data/subj01" ; do

	cd $d/nii/

	# === remove unnecessary files
	rm $d/nii/*multislices*

	# === keep backup
	mkdir orig/
	cp *.nii.gz orig/

	# === rename files appropriately
	mv *MPRAGE* anatomical.nii.gz
	mv *run1* run1.nii.gz
	mv *run2* run2.nii.gz
	mv *run3* run3.nii.gz
	mv *run4* run4.nii.gz
	mv *run5* run5.nii.gz

	mv *B0maps011* B0map_1.nii.gz
	mv *B0maps012* B0map_2.nii.gz

		
	# === skull strip anatomical & create anatomical mask
	bet anatomical.nii.gz anatomical_brain
	fslmaths anatomical_brain -bin anat_mask

	cd ../..

	echo $d

done

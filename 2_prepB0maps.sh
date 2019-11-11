#!/bin/bash
#
#	PREPARE FIELDMAPS
#	  Calculate fieldmaps from B0 files, based on the difference in phase between
#	  2 different echos in a double echo sequence ("stock double-echo gradient echo
#	  field map sequence")
#
#		orig magnitude image is "B0map_1"
#			contains 2 mag images, one for each echo
#		orig phase/fieldmap image is "B0map_2"
#			contains a single phase difference image (subtraction of 2 phase images
#			from each echo)


for d in data/subj*/ ; do
# for d in "data/subj01" ; do

	cd $d/nii/

	# ======= prep magnitude image ======================================================

	#	(a) average 2 mag images
	fslsplit B0map_1
	fslmaths vol0000 -add vol0001 -div 2 B0map_mag
	rm vol*
	#	(b) brain extract mag image
	bet B0map_mag B0map_mag_br
	#	(c) erode this image
	fslmaths B0map_mag_br -ero B0map_mag_brain

	# ======= unwarp (remove jumps of 2pi), convert to rad/s ============================
	fsl_prepare_fieldmap SIEMENS B0map_2 B0map_mag_brain Fmap_rads 2.46

	cd ../..
 
	echo $d
done
#  Demo code for fMRI data analysis pipeline
		Author: Ariana Familiar
 		November 11, 2019
 		University of Pennsylvania

# overview
Demonstrates how to use FSL software via command line to pre-process fMRI data and run first-level GLM.

Bash scripts are to be run in numerical order, and are set up to loop through subject-specific directories in data/ .

# file structure
Nifti files should be located in subject-specific directory within data/ directory, for example:
```bash
	data/
		subj##/
			nii/
```

FSL FEAT design files are located in design_files/ directory.

Timing files for GLM analysis are located in timing/ directory.

# system
* Mac ver 10.13.6
* FSL ver 5.0.10
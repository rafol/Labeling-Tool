===========================================================================
Matlab Labeling Tool for Texture Segmentation on Natural Images
===========================================================================

Written by 
Rafael Sachett Medeiros <rsmedeiros@inf.ufrgs.br>

===========================================================================
Content:

A matlab tool for labeling texture segments on natural images.

===========================================================================
INSTALLATION:

The matlab codes are a standalone implementation.
Just run 'startLabeling.m' to bring up the user interface.

===========================================================================
USAGE:


Just run 'startLabeling.m' to bring up the user interface. 
The images in 'Images/test' will be automatically loaded sequentially.
Once the labeling is finished, the groundtruths will be saved on the "Images/GT" folder.
See the Instructions.txt and Manual.pdf for the labeling metodology used in our paper.

===========================================================================
FILES:

BiSS 		- Multi-scale decomposition library
demo.m		- Test script for running this software
Images		- Some test Images
README.txt 	- This file
SRMlib		- Stochastic Region Merging Library
STRlib		- Stochastic Texture Representation library

===========================================================================
REFERENCES:

If you use this software please refer to the works:

Medeiros, R. S., J. Scharcanski, and A. Wong. "Image Segmentation via Multi-scale Stochastic 
Regional Texture Appearance Models." Computer Vision and Image Understanding (2015).

Medeiros, R.S.; Scharcanski, J.; Wong, A., "Natural scene segmentation based on a stochastic 
texture region merging approach," ICASSP 2013.
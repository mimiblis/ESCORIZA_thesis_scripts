#!/bin/bash
##########################################################################################
#this script is using sam2bed tool from MACS-1.4.2.1 to convert SAM files into BED files
##only needed for human, because macaque is already provided in BED format
#output in BED format
#MACS version 1.4.2.1
#command: sam2bed <sam file> <bed output>

##########################################################################################
#BSUB -L /bin/bash
#BSUB -o std_output_filename
#BSUB -e std_error_filename
#BSUB -M 8000000
#BSUB -R "rusage[mem=8000]"

module add UHTS/Analysis/MACS/1.4.2.1

sam2bed human1.sam human1.bed
sam2bed human2.sam human2.bed
sam2bed human3.sam human3.bed
sam2bed human4.sam human4.bed
sam2bed human5.sam human5.bed
sam2bed human6.sam human6.bed
sam2bed human7.sam human7.bed
sam2bed human8.sam human8.bed
sam2bed human9.sam human9.bed
sam2bed human10.sam human10.bed
sam2bed human11_1.sam human11_1.bed
sam2bed human11_2.sam human11_2.bed
sam2bed human6n.sam human6n.bed
sam2bed human11n.sam human11n.bed
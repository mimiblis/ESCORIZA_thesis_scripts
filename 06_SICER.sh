#!/bin/bash
#################################################################################################################
#this script is using SICER tool to call the peaks from the BED files
#peaks are called once with young sample as input, and old as control and vice versa, both for macaque and human
#we will use only certain samples, the other ones not being useful to us
#human8.bed and macaque2.bed are the two young samples we will be using
#different outputs, but mainly *-W200-G600-FDR1e-3-island.bed which we will use later
#SICER version 1.1
#command: SICER.sh . <input bed file> <control bed file> . <ref genome> 1 200 200 0.8 600 1e-3
#################################################################################################################
#BSUB -L /bin/bash
#BSUB -o std_output_filename
#BSUB -e std_error_filename
#BSUB -M 8000000
#BSUB -R "rusage[mem=8000]"
#BSUB -q long

module add UHTS/Analysis/sicer/1.1

#human
SICER.sh . human8.bed humanOld.bed . hg19 1 200 200 0.8 600 1e-3
SICER.sh . humanOld.bed human8.bed . hg19 1 200 200 0.8 600 1e-3

#macaque
SICER.sh . macaque2.bed macaqueOld.bed . rheMac3 1 200 200 0.8 600 1e-3
SICER.sh . macaqueOld.bed macaque2.bed . rheMac3 1 200 200 0.8 600 1e-3
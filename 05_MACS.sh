#!/bin/bash
#################################################################################################################
#this script is using MACS tool to call the peaks from the BED files
#peaks are called once with young sample as input, and old as control and vice versa, both for macaque and human
#we will use only certain samples, the other ones not being useful to us
#human8.bed and macaque2.bed are the two young samples we will be using
#different outputs, but mainly *_peaks.bed which we will use later
#MACS version 1.4.2.1
#command: macs14 -c <control bed file> -t <input bed file> --nomodel --nolambda -w -n <output name for the files>
#################################################################################################################
#BSUB -L /bin/bash
#BSUB -o std_output_filename
#BSUB -e std_error_filename
#BSUB -M 8000000
#BSUB -R "rusage[mem=8000]"
#BSUB -q long

module add UHTS/Analysis/MACS/1.4.2.1

#human
macs14 -c humanOld.bed -t human8.bed --nomodel --nolambda -w -n human_MACS_YvsO
macs14 -c human8.bed -t humanOld.bed --nomodel --nolambda -w -n human_MACS_OvsY

#macaque
macs14 -c macaqueOld.bed -t macaque2.bed --nomodel --nolambda -w -n macaque_MACS_YvsO
macs14 -c macaque2.bed -t macaqueOld.bed --nomodel --nolambda -w -n macaque_MACS_OvsY
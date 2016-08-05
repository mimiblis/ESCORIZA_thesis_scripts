#!/bin/bash
##########################################################################
#this script is using BOWTIE2 tool to map FASTQ files to the ref genome
##only needed for human, because macaque is already provided in BED format
#output in SAM format
#BOWTIE2 version 2.2.4
##########################################################################
#BSUB -L /bin/bash
#BSUB -o std_output_filename
#BSUB -e std_error_filename
#BSUB -n 8
#BSUB -R "span[ptile=8]"
#BSUB -M 8000000
#BSUB -R "rusage[mem=8000]"

module add UHTS/Aligner/bowtie2/2.2.4

#create index with human genome
bowtie2-build -f male.fa maleHuman
bowtie2-build -f female.fa femaleHuman

#map FASTQ reads to genome
bowtie2 -p 8 -x male human1.fastq > human1.sam
bowtie2 -p 8 -x male human2.fastq > human2.sam
bowtie2 -p 8 -x female human3.fastq > human3.sam
bowtie2 -p 8 -x male human4.fastq > human4.sam
bowtie2 -p 8 -x female human5.fastq > human5.sam
bowtie2 -p 8 -x male human6.fastq > human6.sam
bowtie2 -p 8 -x male human7.fastq > human7.sam
bowtie2 -p 8 -x male human8.fastq > human8.sam
bowtie2 -p 8 -x female human9.fastq > human9.sam
bowtie2 -p 8 -x female human10.fastq > human10.sam
bowtie2 -p 8 -x female human11_1.fastq > human11_1.sam
bowtie2 -p 8 -x female human11_2.fastq > human11_2.sam
bowtie2 -p 8 -x male human6n.fastq > human6n.sam
bowtie2 -p 8 -x female human11n.fastq > human11n.sam
#!/bin/bash
#######################################################################
#this script is using fastq-dump tool to convert SRA files into FASTQ
#SRAtoolkit version 2.5.2
#command: fastq-dump <sra file> <fastq file>
#######################################################################
#BSUB -L /bin/bash
#BSUB -o std_output_filename
#BSUB -e std_error_filename

module add UHTS/Analysis/sratoolkit/2.5.2

#Human:
fastq-dump SRR040069.sra human1.fastq
fastq-dump SRR040070.sra human2.fastq
fastq-dump SRR040071.sra human3.fastq
fastq-dump SRR040072.sra human4.fastq
fastq-dump SRR040073.sra human5.fastq
fastq-dump SRR040074.sra human6.fastq
fastq-dump SRR040075.sra human7.fastq
fastq-dump SRR040076.sra human8.fastq
fastq-dump SRR040077.sra human9.fastq
fastq-dump SRR040078.sra human10.fastq
fastq-dump SRR040079.sra human11_1.fastq
fastq-dump SRR040080.sra human11_2.fastq
fastq-dump SRR040081.sra human6n.fastq
fastq-dump SRR040082.sra human11n.fastq

#Macaque:
fastq-dump SRR576103.sra macaque1.fastq
fastq-dump SRR576104.sra macaque2.fastq
fastq-dump SRR576105.sra macaque3.fastq
fastq-dump SRR576106.sra macaque4.fastq
fastq-dump SRR576107.sra macaque5.fastq

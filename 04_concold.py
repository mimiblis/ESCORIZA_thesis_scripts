##PYTHON version 3.4##
######################
#this is a python script made to concatenate samples coming from old subjects (as we will need them later as concatenated)
##########################################################################################################################

#this function concatenates human old samples
def concatenateHuman(infile1, infile2, infile3, outfile):
    infile1 = open(infile1, 'r')
    infile2 = open(infile2, 'r')
    infile3 = open(infile3, 'r')
    outfile = open(outfile, 'a')

    for line in infile1:
        outfile.write(line)
    for line in infile2:
        outfile.write(line)
    for line in infile3:
        outfile.write(line)

#this function concatenates macaque old samples
def concatenateMacaque(infile1, infile2, outfile):
    infile1 = open(infile1, 'r')
    infile2 = open(infile2, 'r')
    outfile = open(outfile, 'a')

    for line in infile1:
        outfile.write(line)
    for line in infile2:
        outfile.write(line)

concatenateHuman('human9.bed', 'human10.bed', 'human11.bed', 'humanOld.bed')
concatenateHuman('macaque3.bed', 'macaque4.bed', 'macaqueOld.bed')
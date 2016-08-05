##PYTHON version 3.4##
######################
#this script is using both outputs from annotate_prot_coding.R
#to provide output files for each subjects with only protein coding genes
##########################################################################

def keepProteinCodingGenes(annotationFile, proteinCodingGenesFile, fileToWrite):

    annotation = open(annotationFile, 'r')
    proteinCodingGenes = open(proteinCodingGenesFile, 'r')

    outfile = open(fileToWrite, 'w')

    #create a list with the protein coding genes ensembl ID
    listOfID = []
    for line in proteinCodingGenes:
        line = line.rstrip('\n')
        listOfID.append(line)

    #making it work easily with the annotation file
    for line in annotation:
        line = line.split('\t') #line is now a list of the elements that are contained in the line

        if line[6] in listOfID:
            outfile.write('\t'.join(line)) #this will write in the new file only the lines containing a protein coding gene ensembl ID


print('working YvsO human')
keepProteinCodingGenes('YvsO_anno.xls', 'human_protein_coding_genes.tab', 'YvsO_anno_protCodGenes.tab')
print('working OvsY human')
keepProteinCodingGenes('OvsY_anno.xls', 'human_protein_coding_genes.tab', 'OvsY_anno_protCodGenes.tab')
print('working YvsO macaque')
keepProteinCodingGenes('YvsO-mac_anno.xls', 'macaque_protein_coding_genes.tab', 'YvsO-mac_anno_protCodGenes.tab')
print('working OvsY macaque')
keepProteinCodingGenes('OvsY-mac_anno.xls', 'macaque_protein_coding_genes.tab', 'OvsY-mac_anno_protCodGenes.tab')
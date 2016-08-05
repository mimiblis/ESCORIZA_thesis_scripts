##PYTHON version 3.4##
######################
#this script is made to output one file per subject containing only the protein coding genes, 
#for which a peak was annotated as upstream or overlapStart
#and only in autosomal chromosome
#############################################################################################

def keepUpstream(protein_coding_genes_annotated_file, fileToWrite):
    infile = open(protein_coding_genes_annotated_file, 'r')
    outfile = open(fileToWrite, 'w')

    for line in infile:
        if '"upstream"' in line: #we are interested in upstream peaks
            if not '"X"' in line: #we are not going to work with chrX
                if not '"Y"' in line: #we are not going to work with chrY
                    outfile.write(line)
        elif '"overlapStart"' in line: #we are interested in overlapping Start peaks
            if not '"X"' in line: #we are not going to work with chrX
                if not '"Y"' in line: #we are not going to work with chrY
                    outfile.write(line)
        elif '"inside"' in line:
            if not '"X"' in line:
                if not '"Y"' in line:
                    outfile.write(line)

print('working YvsO human')
keepUpstream('YvsO_anno_protCodGenes.tab', 'YvsO_inside_upstream_overlapStart.tab')
print('working OvsY human')
keepUpstream('OvsY_anno_protCodGenes.tab', 'OvsY_inside_upstream_overlapStart.tab')
print('working YvsO macaque')
keepUpstream('YvsO-mac_anno_protCodGenes.tab', 'YvsO-mac_inside_upstream_overlapStart.tab')
print('working OvsY macaque')
keepUpstream('OvsY-mac_anno_protCodGenes.tab', 'OvsY-mac_inside_upstream_overlapStart.tab')
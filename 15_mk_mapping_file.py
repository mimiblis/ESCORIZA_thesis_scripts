#with this script, you will be able to make a mapping file from the output from 'topGO_part1.R'
#these mapping files are necessary to run 'topGO_part2.R'
################################################################################################

import csv

def makeMappingFile(file_from_R, mappingFile):
    infile = open (file_from_R, 'r')
    outfile = open(mappingFile, 'w')

    ens2GO_dico = {}

    for line in infile:
        line = line.replace('\n', '')
        ensGO = line.split('\t')
        if ensGO[0] and ensGO[1] != '""':
            if ensGO[0] not in ens2GO_dico.keys():
                ens2GO_dico[ensGO[0]] = [ensGO[1]]
            else:
                ens2GO_dico[ensGO[0]].append(ensGO[1])

    print(ens2GO_dico)

    for ens, GO in ens2GO_dico.items():
        outfile.write(ens +'\t'+ " ".join(GO) +'\n')

makeMappingFile('GO_youngNotOld_human1.tab', 'mapping_youngNotOld_human.map')
makeMappingFile('GO_oldNotYoung_human1.tab', 'mapping_oldNotYoung_human.map')
makeMappingFile('GO_inAll_human1.tab', 'mapping_inAll_human.map')

makeMappingFile('GO_youngNotOld_macaque1.tab', 'mapping_youngNotOld_macaque.map')
makeMappingFile('GO_oldNotYoung_macaque1.tab', 'mapping_oldNotYoung_macaque.map')
makeMappingFile('GO_inAll_macaque1.tab', 'mapping_inAll_macaque.map')
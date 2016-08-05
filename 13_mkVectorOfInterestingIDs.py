# this script allows you to make lists of ensembl IDs that are in young subject and not in old, in old and not
# in young and in all subjects you will need the files with peaks annotated as upstream or overalpStart a gene
# that you created with 'concatenateOldAnnotations.py'
###############################################################################################################

def makeLists(youngFile, oldFile, outFile1, outFile2, outFile3):
    youngFile = open(youngFile, 'r')
    oldFile = open(oldFile, 'r')
    outFile1 = open(outFile1, 'w')
    outFile2 = open(outFile2, 'w')
    outFile3 = open(outFile3, 'w')

    young = []
    old = []

    youngNotOld = []
    oldNotYoung = []
    both = []

    for line in youngFile:
        line = line.split('\t')
        young.append(line[6])

    for line in oldFile:
        line = line.split('\t')
        old.append(line[6])

    for id in young:
        if id in old:
            both.append(id)
        elif id not in old:
            youngNotOld.append(id)

    for id in old:
        if id not in young:
            oldNotYoung.append(id)

    youngNotOld = list(set(youngNotOld))
    oldNotYoung = list(set(oldNotYoung))
    both = list(set(both))

    outFile1.write(', '.join(youngNotOld))
    outFile2.write(', '.join(oldNotYoung))
    outFile3.write(', '.join(both))


makeLists('hum8_inside_upstream_overlapStart.tab', 'old_inside_up_ovStart_human.tab', 'youngNotOld_human1.tab', 'oldNotYoung_human1.tab', 'inAll_human1.tab')
makeLists('mac2_inside_upstream_overlapStart.tab', 'old_inside_up_ovStart_macaca.tab', 'youngNotOld_macaque1.tab', 'oldNotYoung_macaque1.tab', 'inAll_macaque1.tab')
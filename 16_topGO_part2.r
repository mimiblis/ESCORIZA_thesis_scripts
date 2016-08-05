# this script is the final script for the GO term analysis
# it will give out several files with GO terms related to the genes analysed
## you need to run this script in the same session as the part_1
#############################################################################

##here you should run a vector containing all known human genes  
##and another vector for macaque genes

library(topGO)
library(biomaRt)
library(org.Hs.eg.db)

GOanalysis_part2 <- function(mapping.file, all.Genes.org, result.BP, result.MF, result.CC)
	{
	geneID2GO <- readMappings(file = mapping.file)
	str(head(geneID2GO))
	GO2geneID <- inverseList(geneID2GO)
	genesOfInterest <- names(geneID2GO)
	geneList <- factor(as.integer(all.Genes.org %in% genesOfInterest))
	names(geneList) <- genesOfInterest
	str(geneList)
	
	GOdata.BP <- new("topGOdata", ontology = "BP", allGenes = geneList, annot = annFUN.gene2GO, gene2GO = geneID2GO)
	GOdata.MF <- new("topGOdata", ontology = "MF", allGenes = geneList, annot = annFUN.gene2GO, gene2GO = geneID2GO)
	GOdata.CC <- new("topGOdata", ontology = "CC", allGenes = geneList, annot = annFUN.gene2GO, gene2GO = geneID2GO)

	test.stat <- new("classicCount", testStatistic = GOFisherTest, cutOff = 0.05, name = "Fisher test")
	test.stat.el <- new("elimScore", testStatistic = GOKSTest, cutOff = 0.05, name = "Fisher test")
	resultFisher.classic.BP <- getSigGroups(GOdata.BP, test.stat)
	resultFisher.elim.BP <- getSigGroups(GOdata.BP, test.stat.el)
	resultFisher.classic.CC <- getSigGroups(GOdata.CC, test.stat)
	resultFisher.elim.CC <- getSigGroups(GOdata.CC, test.stat.el)
	resultFisher.classic.MF <- getSigGroups(GOdata.MF, test.stat)
	resultFisher.elim.MF <- getSigGroups(GOdata.MF, test.stat.el)
	
		
	allRes.BP <- GenTable(GOdata.BP, classicFisher = resultFisher.classic.BP, 
		elimFisher = resultFisher.elim.BP, topNodes = 300, 
		orderBy = "elimFisher", ranksOf = "elimFisher")

	allRes.MF <- GenTable(GOdata.MF, classicFisher = resultFisher.classic.MF, 
		elimFisher = resultFisher.elim.MF, topNodes = 300, 
		orderBy = "elimFisher", ranksOf = "classicFisher")

	allRes.CC <- GenTable(GOdata.CC, classicFisher = resultFisher.classic.CC, 
		elimFisher = resultFisher.elim.CC, topNodes = 300, 
		orderBy = "elimFisher", ranksOf = "classicFisher")
		
	write.table(as.data.frame(allRes.BP), file = result.BP, sep = '\t', row.names = FALSE)
	write.table(as.data.frame(allRes.MF), file = result.MF, sep = '\t', row.names = FALSE)
	write.table(as.data.frame(allRes.CC), file = result.CC, sep = '\t', row.names = FALSE)
	}

GOanalysis_part2(mapping.file = 'mapping_youngNotOld_human1.map', all.Genes.org = allGenes.human, result.BP = 'BP_youngNotOld_human.tab', result.MF = 'MF_youngNotOld_human.tab', result.CC = 'CC_youngNotOld_human.tab')
GOanalysis_part2(mapping.file = 'mapping_oldNotYoung_human1.map', all.Genes.org = allGenes.human, result.BP = 'BP_oldNotYoung_human.tab', result.MF = 'MF_oldNotYoung_human.tab', result.CC = 'CC_oldNotYoung_human.tab')
GOanalysis_part2(mapping.file = 'mapping_inAll_human1.map', all.Genes.org = allGenes.human, result.BP = 'BP_inAll_human.tab', result.MF = 'MF_inAll_human.tab', result.CC = 'CC_inAll_human.tab')
GOanalysis_part2(mapping.file = 'mapping_youngNotOld_macaque1.map', all.Genes.org = allGenes.macaque, result.BP = 'BP_youngNotOld_macaque.tab', result.MF = 'MF_youngNotOld_macaque.tab', result.CC = 'CC_youngNotOld_macaque.tab')
GOanalysis_part2(mapping.file = 'mapping_oldNotYoung_macaque1.map', all.Genes.org = allGenes.macaque, result.BP = 'BP_oldNotYoung_macaque.tab', result.MF = 'MF_oldNotYoung_macaque.tab', result.CC = 'CC_oldNotYoung_macaque.tab')
GOanalysis_part2(mapping.file = 'mapping_inAll_macaque1.map', all.Genes.org = allGenes.macaque, result.BP = 'BP_inAll_macaque.tab', result.MF = 'MF_inAll_macaque.tab', result.CC = 'CC_inAll_macaque.tab')





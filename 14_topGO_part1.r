# this scripts allows to compute the GO term related to a list of ENSEMBL IDs
# you need enough RAM on your macine to make this script work correctly
##############################################################################
library(topGO)
library(biomaRt)

GOanalysis_part1 <- function(vector.of.ENSids, organism, outputFile)
	{
	human <- useMart("ENSEMBL_MART_ENSEMBL", dataset = "hsapiens_gene_ensembl", host = "jul2015.archive.ensembl.org")
	macaca <- useMart("ENSEMBL_MART_ENSEMBL", dataset = "mmulatta_gene_ensembl", host = "jul2015.archive.ensembl.org")
	goids <- getBM(attributes=c('ensembl_gene_id', 'go_id'), filters='ensembl_gene_id', 
	values = vector.of.ENSids, mart = organism)

	write.table(as.data.frame(goids), file = outputFile, sep = '\t', row.names = FALSE)
	}
##here you should run a vector containing the id's you are interested in##
###for my personal analyses I ran the following vectors, for which I will not put the details here:
###youngNotOld_human, oldNotYoung_human, inAll_human, youngNotOld_macaque, oldNotYoung_macaque, inAll_macaque
###the different vectors come from the preceding python outputs

GOanalysis_part1(vector.of.ENSids = youngNotOld_human, organism = human, outputFile = 'GO_youngNotOld_human1.tab')
GOanalysis_part1(vector.of.ENSids = oldNotYoung_human, organism = human, outputFile = 'GO_oldNotYoung_human1.tab')
GOanalysis_part1(vector.of.ENSids = inAll_human, organism = human, outputFile = 'GO_inAll_human1.tab')

GOanalysis_part1(vector.of.ENSids = youngNotOld_macaque, organism = macaca, outputFile = 'GO_youngNotOld_macaque1.tab')
GOanalysis_part1(vector.of.ENSids = oldNotYoung_macaque, organism = macaca, outputFile = 'GO_oldNotYoung_macaque1.tab')
GOanalysis_part1(vector.of.ENSids = inAll_macaque, organism = macaca, outputFile = 'GO_inAll_macaque1.tab')
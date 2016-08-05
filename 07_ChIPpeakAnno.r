##R version 3.2.1##
###################
#this script will provide files with protein coding genes for the macaque and human
#it will also annotate the peaks called by SICER
####################################################################################
library(ChIPpeakAnno)
library(GenomicRanges)
library(GenomicFeatures)
library(biomaRt)
data(TSS.human.GRCh37)

#create a list with all human protein coding genes as ENSEMBL IDs
mart <- useMart(biomart = "ENSEMBL_MART_ENSEMBL",dataset="hsapiens_gene_ensembl", host = "jul2015.archive.ensembl.org")
annotation <- getBM(attributes = c('ensembl_gene_id', 'gene_biotype'), mart=mart)
protein.coding.human <- annotation[which(annotation$gene_biotype == 'protein_coding'),]

write.table(as.data.frame(protein.coding.human$ensembl_gene_id), file = 'human_protein_coding_genes.tab', row.names =FALSE)

#annotate the human peaks called by SICER
annotateHuman <- function(BED.file, output.file) 
	{
	bedFile <- read.table(BED.file, sep='\t')
	colnames(bedFile) <- c('chr', 'start', 'end','strand', 'score')
	bedFile.GR <- with(bedFile, GRanges(chr, IRanges(start,end), strand, score))
	
	annotation <- annotatePeakInBatch(bedFile.GR, AnnotationData=TSS.human.GRCh37, output='overlapping', maxgap=5000L)
	write.table(as.data.frame(annotation), file = output.file, sep = '\t', row.names = FALSE)
	}	
annotateHuman(BED.file = 'C:\\Users\\angel\\Documents\\Master_project\\05_peakCalling\\05_02_SICER\\HomoSapiens\\sicer_yO\\hum8-W200-G600.txt', output.file = 'YvsO_anno-islands.xls')
annotateHuman(BED.file = 'C:\\Users\\angel\\Documents\\Master_project\\05_peakCalling\\05_02_SICER\\HomoSapiens\\sicer_yO\\2nd_try\\hum8-W200-G600-FDR1e-3-island.bed', output.file = 'YvsO_anno2.xls')
annotateHuman(BED.file = 'C:\\Users\\angel\\Documents\\Master_project\\05_peakCalling\\05_02_SICER\\HomoSapiens\\siceroY\\old-W200-G600-FDR1e-3-island.bed', output.file = 'hum9_anno.xls')

annotateHuman(BED.file = 'C:\\Users\\angel\\Documents\\Master_project\\06_peakAnnotation\\MACS\\hum8ctrl878_peaks.txt', output.file = 'hum8_annoMACS.xls')
annotateHuman(BED.file = 'C:\\Users\\angel\\Documents\\Master_project\\06_peakAnnotation\\MACS\\hum11ctrl878_peaks.txt', output.file = 'hum11_annoMACS.xls')

#create a list with all macaque protein coding genes as ENSEMBL IDs
ensembl = useMart(biomart = "ENSEMBL_MART_ENSEMBL", host = "jul2015.archive.ensembl.org")
ensembl = useDataset("mmulatta_gene_ensembl", mart=ensembl)
props <- c("ensembl_gene_id", "start_position", "end_position", "chromosome_name", "strand")
genes <- getBM(attributes=props, mart=ensembl)

mmul_anno <- RangedData(IRanges(start=genes[,"start_position"], 
	end=genes[,"end_position"], names=genes[,"ensembl_gene_id"]), 
	space=genes[,"chromosome_name"], strand=genes[,"strand"])
	
annotation.mac <- getBM(attributes = c('ensembl_gene_id', 'gene_biotype'), mart=ensembl)

write.table(as.data.frame(annotation.mac), file = 'macaque_protein_coding_genes.tab', row.names =FALSE)


#annotate the macaque peaks called by SICER
annotateMacaque <- function(BED.file, output.file) 
	{
	bedFile <- read.table(BED.file, sep='\t')
	colnames(bedFile) <- c('chr', 'start', 'end','summit')
	bedFile.GR <- with(bedFile, GRanges(chr, IRanges(start,end)))
	
	annotation <- annotatePeakInBatch(bedFile.GR, AnnotationData=mmul_anno, output='overlapping', maxgap=5000L)
	write.table(as.data.frame(annotation), file = output.file, sep = '\t', row.names = FALSE)
	}
annotateMacaque(BED.file = 'C:\\Users\\angel\\Documents\\Master_project\\05_peakCalling\\05_02_SICER\\MacacaMulatta\\YvsO\\mac2good-W200-G600-FDR1e-3-island.bed', output.file = 'YvsO-mac_anno.xls')
annotateMacaque(BED.file = 'C:\\Users\\angel\\Documents\\Master_project\\05_peakCalling\\05_02_SICER\\MacacaMulatta\\OvsY\\old_mac-W200-G600-FDR1e-3-island.bed', output.file = 'OvsY-mac_anno.xls')
annotateMacaque(BED.file = 'C:\\Users\\angel\\Documents\\Master_project\\06_peakAnnotation\\MACS\\mac2_peaks.txt', output.file = 'mac2_annoMACS.xls')
annotateMacaque(BED.file = 'C:\\Users\\angel\\Documents\\Master_project\\06_peakAnnotation\\MACS\\mac4_peaks.txt', output.file = 'mac4_annoMACS.xls')

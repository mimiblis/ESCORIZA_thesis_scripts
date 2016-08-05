##R version 3.2.1##
###################
#this script will provide annotations and GO term analyses
#obtained with the ChIPseeker package
###########################################################
require(ChIPseeker)
require(TxDb.Hsapiens.UCSC.hg19.knownGene)
txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene
require(clusterProfiler)
library('UpSetR')
library('topGO')

##YvsO-Human

#peak annotation
peakAnno.young.hum <- annotatePeak('C:\\Users\\angel\\Documents\\Master_project\\05_peakCalling\\05_02_SICER\\HomoSapiens\\sicer_yO\\hum8-W200-G600-FDR1e-3-island.bed', 
	tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")

#visualize annotation
plotAnnoPie(peakAnno.young.hum, main='Annotations of the peaks called by SICER for young human subjects')

#GO enrichment 
bp.young.hum <- enrichGO(as.data.frame(peakAnno.young.hum)$geneId, ont="BP", readable=TRUE)
barplot(bp.young.hum, drop=TRUE, showCategory=20, title='Biological Process GO terms related to the annotations of young human subjects') #summary of GO results


##OvsY-Human

#peak annotation
peakAnno.old.hum <- annotatePeak('C:\\Users\\angel\\Documents\\Master_project\\05_peakCalling\\05_02_SICER\\HomoSapiens\\siceroY\\old-W200-G600-FDR1e-3-island.bed', 
	tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")

#visualize annotation
plotAnnoPie(peakAnno.old.hum) #piechart


#GO enrichment  
bp.old.hum <- enrichGO(as.data.frame(peakAnno.old.hum)$geneId, ont="BP", readable=TRUE)
barplot(bp.old.hum, drop=TRUE, showCategory=20, title='Biological Process GO terms related to the annotations of old human subjects') #summary of GO results

##YvsO-Macaque
#create GR object with SICER file
young.bed.mac <- read.table('C:\\Users\\angel\\Documents\\Master_project\\05_peakCalling\\05_02_SICER\\MacacaMulatta\\YvsO\\mac2good-W200-G600-FDR1e-3-island.bed', sep='\t')
colnames(young.bed.mac) <- c('chr', 'start', 'end','summit')
young.bed.GR.mac <- with(young.bed.mac, GRanges(chr, IRanges(start,end)))

#peak annotation
peakAnno.young.mac <- annotatePeak(young.bed.GR.mac, tssRegion = c(-3000, 3000), TxDb = NULL,
level = "transcript", assignGenomicAnnotation = TRUE,
genomicAnnotationPriority = c("Promoter", "5UTR", "3UTR", "Exon", "Intron",
"Downstream", "Intergenic"), annoDb = NULL, addFlankGeneInfo = FALSE,
flankDistance = 5000, verbose = TRUE)

#visualize annotation
plotAnnoPie(peakAnno.young.mac) #piechart

#GO enrichment  !!supports macaca!!!
bp.young.mac <- enrichGO(as.data.frame(peakAnno.young.mac)$geneId, ont="BP", readable=TRUE)
barplot(bp.young.mac, drop=TRUE, showCategory=20) #summary of GO results

##OvsY-Macaque
#create GR object with SICER file
old.bed.mac <- read.table('C:\\Users\\angel\\Documents\\Master_project\\05_peakCalling\\05_02_SICER\\MacacaMulatta\\OvsY\\old_mac-W200-G600-FDR1e-3-island.bed', sep='\t')
colnames(old.bed.mac) <- c('chr', 'start', 'end','summit')
old.bed.GR.mac <- with(old.bed.mac, GRanges(chr, IRanges(start,end)))

covplot(old.bed.GR.mac) #chip peaks over all chromosomes

#peak annotation
peakAnno.old.mac <- annotatePeak(old.bed.GR.mac, tssRegion = c(-3000, 3000), TxDb = NULL,
level = "transcript", assignGenomicAnnotation = TRUE,
genomicAnnotationPriority = c("Promoter", "5UTR", "3UTR", "Exon", "Intron",
"Downstream", "Intergenic"), annoDb = NULL, addFlankGeneInfo = FALSE,
flankDistance = 5000, verbose = TRUE)

#visualize annotation
plotAnnoPie(peakAnno.old.mac) #piechart

#GO enrichment  !!supports macaca!!!
bp.old.mac <- enrichGO(as.data.frame(peakAnno.old.mac)$geneId, ont="BP", readable=TRUE)
barplot(bp.old.mac, drop=TRUE, showCategory=20) #summary of GO results

##Heatmaps - chipseeker package
promoter <- getPromoters(TxDb=txdb, upstream=3000, downstream=3000)
tagMatrix.young.hum <- getTagMatrix(young.bed.GR.hum, windows=promoter)
tagMatrix.old.hum <- getTagMatrix(old.bed.GR.hum, windows=promoter)
#tagMatrix.young.mac <- getTagMatrix(young.bed.GR.mac, windows=promoter)
#tagMatrix.old.mac <- getTagMatrix(old.bed.GR.mac, windows=promoter)

tagHeatmap(tagMatrix.young.hum, xlim=c(-3000, 3000), color="red")
tagHeatmap(tagMatrix.old.hum, xlim=c(-3000, 3000), color="red")
#tagHeatmap(tagMatrix.young.mac, xlim=c(-3000, 3000), color="red")
#tagHeatmap(tagMatrix.old.mac, xlim=c(-3000, 3000), color="red")

##heatmaps - genomation package
library(genomation)

#make GRange object with human tss conserved across macaque
tss.conserved <- read.table('C:/Users/angel/Documents/Master_project/09_heatmaps/humanTss_forHeatmaps.bed', sep='\t')
colnames(tss.conserved) <- c('chr', 'start', 'end')
tss.conserved.GR <- with(tss.conserved, GRanges(chr, IRanges(start,end)))

#make a score matrix with target = peaks in young human
young.peaks.hum <- 'C:\\Users\\angel\\Documents\\Master_project\\05_peakCalling\\05_02_SICER\\HomoSapiens\\sicer_yO\\hum8-W200-G600-FDR1e-3-island.bed'
peaks.young.hum <- readGeneric(young.peaks.hum, keep.all.metadata = TRUE)
peaks.young.hum <- peaks.young.hum[order(peaks.young.hum$value)]
peaks.young.hum <- resize(peaks.young.hum, width = 1000, fix = "center")

#make a score matrix with target = peaks in old human
old.peaks.hum <- 'C:\\Users\\angel\\Documents\\Master_project\\05_peakCalling\\05_02_SICER\\HomoSapiens\\siceroY\\old-W200-G600-FDR1e-3-island.bed'
peaks.old.hum <- readGeneric(old.peaks.hum, keep.all.metadata = TRUE)
peaks.old.hum <- peaks.old.hum[order(peaks.young.hum$value)]
peaks.old.hum <- resize(peaks.old.hum, width = 1000, fix = "center")

windows = tss.conserved.GR
targets = list(peaks.young.hum, peaks.old.hum)
cl1 <- function(x) kmeans(x, centers=3)$cluster

sml.hum = ScoreMatrixList(targets = targets, windows = windows, bin.num = 50, strand.aware = TRUE)
multiHeatMatrix(sml.hum, xcoords = c(-3000, 3000))


##write interesting figure into a PDF
pdf("chipseeker_figures.pdf",width=15,height=10)
par(mfrow=c(1,1))
plotAnnoPie(peakAnno.young.hum, main='Distribution of peaks in young human')
plotAnnoPie(peakAnno.old.hum, main='Distribution of peaks in old human')
plotAnnoPie(peakAnno.young.mac, main='Distribution of peaks in young macaque')
plotAnnoPie(peakAnno.old.mac, main='Distribution of peaks in old macaque')
barplot(bp.young.hum, drop=TRUE, showCategory=20, main='GO term analysis for peaks in young human')
barplot(bp.old.hum, drop=TRUE, showCategory=20, main='GO term analysis for peaks in old human')
barplot(bp.young.mac, drop=TRUE, showCategory=20, main='GO term analysis for peaks in young macaque')
barplot(bp.old.mac, drop=TRUE, showCategory=20, main='GO term analysis for peaks in old macaque')
tagHeatmap(tagMatrix.young.hum, xlim=c(-3000, 3000), color="blue", xlab='Genomic Region around TSS', ylab='Peaks')
tagHeatmap(tagMatrix.old.hum, xlim=c(-3000, 3000), color="blue", xlab='Genomic Region around TSS', ylab='Peaks')
#tagHeatmap(tagMatrix.young.mac, xlim=c(-3000, 3000), color="blue")
#tagHeatmap(tagMatrix.old.mac, xlim=c(-3000, 3000), color="blue")
heatMatrix(sm.young.hum, xcoords = c(-3000, 3000))
heatMatrix(sm.old.hum, xcoords = c(-3000, 3000))
dev.off()

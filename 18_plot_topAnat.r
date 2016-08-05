##R version 3.2.1##
###################
#this script is made to represent topAnat results in a nice comprehensive way
#############################################################################
library(ggplot2)
library(reshape2)

foldEnrich.allSubjects <- read.table('C:\\Users\\angel\\Documents\\Master_project\\06_peakAnnotation\\foldEnrich.txt')
colnames(foldEnrich.allSubjects) <- c('FoldEnrich_YoungHuman', 'FoldEnrich_OldHuman', 'FoldEnrich_YoungMacaque', 'FoldEnrich_OldMacaque')

topAnat.young.hum <- read.table('C:\\Users\\angel\\Documents\\Master_project\\06_peakAnnotation\\Homo_sicerYO\\topAnat_YvsO.txt')
colnames(topAnat.young.hum) <- c('Name', 'Value')
topAnat.old.hum <- read.table('C:\\Users\\angel\\Documents\\Master_project\\06_peakAnnotation\\Homo_sicerOY\\topAnat_OvsY.txt')
colnames(topAnat.old.hum) <- c('Name', 'Value')
topAnat.young.mac <- read.table('C:\\Users\\angel\\Documents\\Master_project\\06_peakAnnotation\\Maca_sicerYO\\topAnat_YvsO-mac.txt')
colnames(topAnat.young.mac) <- c('Name', 'Value')
topAnat.old.mac <- read.table('C:\\Users\\angel\\Documents\\Master_project\\06_peakAnnotation\\Maca_sicerOY\\topAnat_OvsY-mac.txt')
colnames(topAnat.old.mac) <- c('Name', 'Value')

color.scores.hum.young <- foldEnrich.allSubjects$FoldEnrich_YoungHuman
color.scores.hum.old <- foldEnrich.allSubjects$FoldEnrich_OldHuman
color.scores.mac.young <- foldEnrich.allSubjects$FoldEnrich_YoungMacaque
color.scores.mac.old <- foldEnrich.allSubjects$FoldEnrich_OldMacaque

pdf('topAnatResults.pdf')

ggplot(topAnat.young.hum,aes(Value, Name, colour=color.scores.hum.young)) + geom_point(size = 10) + xlab("Adjusted FDR")+ 
  theme(axis.text=element_text(size=8),
        axis.title=element_text(size=9,face="bold"))
ggplot(topAnat.young.hum,aes(Value, Name, colour=color.scores.hum.old)) + geom_point(size = 10) + xlab("Adjusted FDR")+ 
  theme(axis.text=element_text(size=8),
        axis.title=element_text(size=9,face="bold"))
ggplot(topAnat.young.hum,aes(Value, Name, colour=color.scores.mac.young)) + geom_point(size = 10) + xlab("Adjusted FDR")+ 
  theme(axis.text=element_text(size=8),
        axis.title=element_text(size=9,face="bold"))
ggplot(topAnat.young.hum,aes(Value, Name, colour=color.scores.mac.old)) + geom_point(size = 10) + xlab("Adjusted FDR")+ 
  theme(axis.text=element_text(size=8),
        axis.title=element_text(size=9,face="bold"))

dev.off()



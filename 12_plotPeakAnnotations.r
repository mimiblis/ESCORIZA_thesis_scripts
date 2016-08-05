##R version 3.2.1##
###################
#make piecharts and VennDiagram with the annotations of peaks
###############################################################

library(VennDiagram)
require(grDevices)

pdf('pie_OvsY_YvsO-hum-mac.pdf', 12, 10)
par(mfrow=c(2, 2))

#pie for young human
fraction <- c(77, 141, 1337, 62, 61, 250)
names(fraction) <- c('upstream 3.99%', 'downstream 7.31%', 'overlap start 69.34%', 'overlap end 3.21%', 'include gene 3.16%', 'inside gene 12.96%')
pie(fraction, labels = names(fraction) , clockwise = TRUE, radius = 0.8, col = c('blue', 'cyan', 'red', 'orange', 'green', 'yellow'), main = 'Peak annotation in young human')

#pie for old human
fraction <- c(335, 662, 1109, 276, 70, 3120)
names(fraction) <- c('upstream 6.01%', 'downstream 11.88%', 'overlap start 19.90%', 'overlap end 4.95%', 'include gene 1.25%', 'inside gene 55.99%')
pie(fraction, labels = names(fraction) , clockwise = TRUE, radius = 0.8, col = c('blue', 'cyan', 'red', 'orange', 'green', 'yellow'), main = 'Peak annotation in old human')

#pie for young macaque
fraction <- c(63, 56, 35, 32, 11, 432)
names(fraction) <- c('upstream 10.02%', 'downstream 8.90%', 'overlap start 5.56%', 'overlap end 5.08%', 'include gene 1.78%', 'inside gene 68.68%')
pie(fraction, labels = names(fraction) , clockwise = TRUE, radius = 0.8, col = c('blue', 'cyan', 'red', 'orange', 'green', 'yellow'), main = 'Peak annotation in young macaque')

#pie for old macaque
fraction <- c(551, 570, 482, 581, 205, 3731)
lbls <- c('upstream 9.00%', 'downstream 9.31%', 'overlap start 7.87%', 'overlap end 9.49%', 'include gene 3.35%', 'inside gene 60.96%')
pie(fraction, labels = lbls , clockwise = TRUE, radius = 0.8, col = c('blue', 'cyan', 'red', 'orange', 'green', 'yellow'), main = 'Peak annotation in old macaque')

#pie for young human upstream or ovStart a gene
fraction <- c(77, 1337, 250)
names(fraction) <- c('upstream 4.62%', 'overlap start 80.35%', 'inside 15.02%')
pie(fraction, labels = names(fraction), clockwise = TRUE, radius = 0.8, col = c('blue', 'red', 'yellow'), main = 'Interesting peaks in young human')

#pie for old human upstream or ovStart a gene
fraction <- c(335, 1109, 3120)
names(fraction) <- c('upstream 7.34%', 'overlap start 25.29%', 'inside 68.36%')
pie(fraction, labels = names(fraction), clockwise = TRUE, radius = 0.8, col = c('blue', 'red', 'yellow'), main = 'Interesting peaks in old human')

#pie for young macaque upstream or ovStart a gene
fraction <- c(63, 35, 432)
names(fraction) <- c('upstream 11.88%', 'overlap start 6.60%', 'inside 81.51%')
pie(fraction, labels = names(fraction), clockwise = TRUE, radius = 0.8, col = c('blue', 'red', 'yellow'), main = 'Interesting peaks in young macaque')

#pie for old macaque upstream or ovStart a gene
fraction <- c(551, 482, 3731)
names(fraction) <- c('upstream 11.56%', 'overlap start 10.12%', 'inside 78.32%')
pie(fraction, labels = names(fraction), clockwise = TRUE, radius = 0.8, col = c('blue', 'red', 'yellow'), main = 'Interesting peaks in old macaque')

dev.off()


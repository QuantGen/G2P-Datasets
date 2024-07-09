# install.packages("assignPOP")
library(assignPOP)

# Get geno
data <- read.Genepop('FullSNPPanel.txt')
geno <- geno$DataMatrix
dim(geno)
length(geno$LocusName)

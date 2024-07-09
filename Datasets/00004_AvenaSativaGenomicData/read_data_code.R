# Get geno
library(data.table)
geno <- fread('DivPanel_markers.txt', check.names = F)
dim(geno)

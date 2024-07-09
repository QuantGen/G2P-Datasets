# Get geno
library(adegenet)
geno <- read.genepop('ld_hwe_pruned_crab.gen')
geno <- geno$tab
dim(geno)

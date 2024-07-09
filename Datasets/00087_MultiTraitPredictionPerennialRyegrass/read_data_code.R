library(readxl)

# Get geno
load('File S1.RData')
geno <- Geno_mark_denisty
dim(geno)

# Get pheno
pheno <- read_xlsx('File S4.xlsx')
head(pheno)

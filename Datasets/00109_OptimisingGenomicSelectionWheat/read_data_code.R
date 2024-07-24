library(readxl)

# Get geno
load('FileS4.RData')
geno <- mat
dim(geno)

# Get pheno
pheno <- read_xlsx('FileS5.xlsx')
head(pheno)

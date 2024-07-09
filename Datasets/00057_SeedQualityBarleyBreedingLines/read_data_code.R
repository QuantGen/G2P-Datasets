library(readxl)

# Get geno
geno <- read.csv('pone.0164494.s002.csv')
dim(geno)

# Get pheno
pheno <- read_excel('pone.0164494.s001.xlsx')
head(pheno)

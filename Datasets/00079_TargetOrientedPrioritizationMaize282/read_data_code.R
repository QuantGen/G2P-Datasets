library(data.table)

# Get geno
geno <- fread('SNP55K_maize282_numOrdered.txt')
dim(geno)

# Get pheno
pheno <- fread('pheno_maize282.txt')
head(pheno)

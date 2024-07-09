library(data.table)

# Get geno
geno <- fread('FiltStep1_minQ10_Gen.txt')
dim(geno)

# Get pheno
pheno <- fread('DF_phenotypes_dryad.txt')
head(pheno)
library(data.table)

# Get geno
geno <- fread('Geno_ASSO_NCRIPS_USP_28Ksnps.txt') 
dim(geno) 

# Get pheno
pheno <- fread('BLUPS_PH_EH_.txt')
head(pheno)

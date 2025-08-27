library(data.table)

# Get geno
geno <- fread('genotypes.txt')
dim(geno)

# Get pheno
pheno <- fread('phenotypes.txt')
head(pheno)

# Get ped
ped <- fread('pedigree.txt')
head(ped)

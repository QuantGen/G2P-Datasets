library(data.table)

# Get geno
geno <- fread('SVDimp dryad.txt')
dim(geno)

# Get pheno
pheno <- fread('phen mask dryad.txt')
head(pheno)

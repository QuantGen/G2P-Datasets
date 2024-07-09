library(BGLR)

# Read data
data(wheat)

# Get geno
geno = wheat.X
dim(geno)

# Get pheno
pheno = wheat.Y
dim(pheno)

library(SoyNAM)

# Read data
data(soybase)

# Get geno
geno <- gen.qa
dim(geno)

# Get pheno
pheno <- data.line.qa
head(pheno)

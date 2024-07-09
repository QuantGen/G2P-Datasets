library(data.table)

# Get geno
geno <- read.csv('NCII_genotype.csv')
dim(geno)

# Get pheno
pheno <- fread('NCII_trait.txt')
head(pheno)

load('1.root.Data/SNPs.rda')
geno <- SNPs
dim(geno)

# Get pheno
pheno <- read.csv('1.root.Data/Phenos.csv')
head(pheno)

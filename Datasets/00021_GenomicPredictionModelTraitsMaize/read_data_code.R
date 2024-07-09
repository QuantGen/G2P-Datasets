library(data.table)

# Get geno
geno <- fread('Maize.hmp.txt')
dim(geno)

# Get pheno
pheno1 <- fread('EarHT.txt')
pheno2 <- fread('dPoll.txt')
pheno <- merge(pheno1,pheno2)
head(pheno)

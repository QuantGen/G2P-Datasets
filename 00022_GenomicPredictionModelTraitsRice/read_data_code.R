library(data.table)

# Get geno
geno <- fread('Rice.hmp.txt')
dim(geno)

# Get pheno
pheno1 <- fread('Seed_PP.txt')
pheno2 <- fread('Panicle_NM_PP.txt')
pheno <- merge(pheno1,pheno2)
head(pheno)
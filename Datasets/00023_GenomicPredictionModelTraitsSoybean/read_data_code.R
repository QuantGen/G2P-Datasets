library(data.table)

# Get geno
geno <- fread('Soybean.hmp.txt')
dim(geno)

# Get pheno
pheno1 <- fread('ComC13.txt')
pheno2 <- fread('ComCW.txt')
pheno <- merge(pheno1,pheno2)
head(pheno)

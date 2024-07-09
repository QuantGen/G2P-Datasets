library(BEDMatrix)

# Get geno
geno <- BEDMatrix('foreleg.bed')
dim(geno)

# Get pheno
pheno1 <- fread('foreleg.fam', select = 1:6,col.names = c('FAM ID','Individual ID','Father ID','Mother ID','Sex','Phenotype'))
pheno2 <- fread('foreleg.fam', select = 7:66)
pheno <- cbind(pheno1,pheno2)
head(pheno)


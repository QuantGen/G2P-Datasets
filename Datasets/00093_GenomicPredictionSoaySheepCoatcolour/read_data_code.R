library(BEDMatrix)

# Get geno
geno <- BEDMatrix('coatcolour.bed')
dim(geno)

# Get pheno
pheno1 <- fread('coatcolour.fam', select = 1:6,col.names = c('FAM ID','Individual ID','Father ID','Mother ID','Sex','Phenotype'))
pheno2 <- fread('coatcolour.fam', select = 7:66)
pheno <- cbind(pheno1,pheno2)
head(pheno)


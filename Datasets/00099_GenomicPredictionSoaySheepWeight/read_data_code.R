library(BEDMatrix)

# Get geno
geno <- BEDMatrix('weight.bed')
dim(geno)

# Get pheno
pheno1 <- fread('weight.fam', select = 1:6,col.names = c('FAM ID','Individual ID','Father ID','Mother ID','Sex','Phenotype'))
pheno2 <- fread('weight.fam', select = 7:66)
pheno <- cbind(pheno1,pheno2)
head(pheno)

# Get map
map <- read.delim('weight.bim', header = F, col.names = c('chromosome', 'snp.name', 'cM', 'position', 'allele.1', 'allele.2'))
head(map)


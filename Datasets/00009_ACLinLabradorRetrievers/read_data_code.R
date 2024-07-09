# Get geno
library(BEDMatrix)
geno <- BEDMatrix('wisc_cornell_G3.bed')
dim(geno)

# Get map
map <- read.delim('wisc_cornell_G3.bim', header = F, col.names = c('chromosome', 'snp.name', 'cM', 'position', 'allele.1', 'allele.2'))
head(map)

# Get pheno
pheno <- read.delim('wisc_cornell_G3.fam', header = F, sep = ' ', col.names = c('fam', 'id', 'pat', 'mat', 'sex', 'pheno'))
head(pheno)

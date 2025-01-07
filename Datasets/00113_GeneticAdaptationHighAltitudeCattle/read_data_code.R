library(BEDMatrix)

# Get geno
geno <- BEDMatrix('bob.bed')
dim(geno)

# Get map
map <- read.delim('bob.bim', header = F, col.names = c('chromosome', 'snp.name', 'cM', 'position', 'allele.1', 'allele.2'))
head(map)

# Get pheno
pheno <- read.delim('bob.fam', header = F, sep = ' ', col.names = c('fam', 'id', 'pat', 'mat', 'sex', 'pheno'))
head(pheno)

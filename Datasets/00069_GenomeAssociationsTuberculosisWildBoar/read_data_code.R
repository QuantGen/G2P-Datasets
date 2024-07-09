library(BEDMatrix)

# Get geno
geno <- BEDMatrix('mydata_QC_by_TB.bed')
dim(geno)

# Get map
map <- read.delim('mydata_QC_by_TB.bim', header = F, col.names = c('chromosome', 'snp.name', 'cM', 'position', 'allele.1', 'allele.2'))
head(map)

# Get pheno
pheno <- read.delim('mydata_QC_by_TB.fam', header = F, sep = ' ', col.names = c('fam', 'id', 'pat', 'mat', 'sex', 'pheno'))
head(pheno)

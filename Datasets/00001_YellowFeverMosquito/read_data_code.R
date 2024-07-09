# Get geno
library(BEDMatrix)
bedfile <- list.files(pattern = '.bed')
bimfile <- list.files(pattern = '.bim')
geno <- BEDMatrix(bedfile)
dim(geno)

# Get map
map <- read.delim(bimfile, header = F, col.names = c('chromosome', 'snp.name', 'cM', 'position', 'allele.1', 'allele.2'))
head(map)

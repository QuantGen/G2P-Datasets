# Get geno
library(BEDMatrix)
geno <- BEDMatrix('ADAPTmap_genotypeTOP_20160222_full.bed')
dim(geno)

# Get map
map <- read.delim('ADAPTmap_genotypeTOP_20160222_full.bim', 
                  header = F, col.names = c('chromosome', 'snp.name', 'cM', 
                                            'position', 'allele.1', 'allele.2'))
head(map)

# Get pheno
pheno <- read.delim('ADAPTmap_genotypeTOP_20160222_full.fam', header = F, sep = '	', 
                    col.names = c('fam', 'id', 'pat', 'mat', 'sex', 'pheno'))
head(pheno)

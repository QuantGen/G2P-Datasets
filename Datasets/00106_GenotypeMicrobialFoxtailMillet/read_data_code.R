library(BEDMatrix)

# Get geno
geno <- BEDMatrix('wyy2017-Foxtail-millet-data-analysis-2df29e4/Figure1_and_Figure5/data/millet.snp.gwas.bed')
dim(geno)

# Get map
map <- read.delim('wyy2017-Foxtail-millet-data-analysis-2df29e4/Figure1_and_Figure5/data/millet.snp.gwas.bim', header = F, col.names = c('chromosome', 'snp.name', 'cM', 'position', 'allele.1', 'allele.2'))
head(map)

# Get pheno
pheno <- read.delim('wyy2017-Foxtail-millet-data-analysis-2df29e4/Figure1_and_Figure5/data/millet.snp.gwas.fam', header = F, sep = ' ', col.names = c('fam', 'id', 'pat', 'mat', 'sex', 'pheno'))
head(pheno)
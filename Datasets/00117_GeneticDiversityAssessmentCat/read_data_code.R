library(BEDMatrix)

# Get geno
geno <- BEDMatrix('ASM_deposit_cat_snp_array_20200131ver_Japanese.bed')
dim(geno)

# Get map
map <- read.delim('ASM_deposit_cat_snp_array_20200131ver_Japanese.bim', header = F, col.names = c('chromosome', 'snp.name', 'cM', 'position', 'allele.1', 'allele.2'))
head(map)

# Get pheno
pheno <- read.delim('ASM_deposit_cat_snp_array_20200131ver_Japanese.fam', header = F, sep = ' ', col.names = c('fam', 'id', 'pat', 'mat', 'sex', 'pheno'))
head(pheno)

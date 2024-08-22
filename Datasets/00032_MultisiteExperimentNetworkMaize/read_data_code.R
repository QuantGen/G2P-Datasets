# Get geno
geno <- read.table('7a-Genotyping_50K_41722.tab',header = TRUE)
# geno <- read.csv('7a-Genotyping_50K_41722.csv',header = TRUE)
dim(geno)

# Get pheno
pheno <- read.table('2a-GrainYield_components_Plot_level.tab')
# pheno <- read.csv('2a-GrainYield_components_Plot_level.csv')
head(pheno)

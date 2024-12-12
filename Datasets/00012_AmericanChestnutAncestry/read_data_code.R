# Read data
library(vcfR)
graw <- read.vcfR('Chestnut_B3F2_August2018_MAF01_missing10_Cdentata0.5alignment_notimputed.vcf')

# Get geno
geno <- vcfR2loci(graw)
dim(geno)

# Get map
map <- graw@fix
head(map)

# Get pheno
pheno <- read.csv('Clapper_Graves_B3F2_phenotypes_2018_clean.csv')
head(pheno)

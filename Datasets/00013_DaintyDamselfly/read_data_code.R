# Read data
library(vcfR)
raw <- read.vcfR('SNP_dataset_Coenagrion_scitulum.vcf')

# Get geno
geno <- vcfR2loci(raw)
dim(geno)

# Get map
map <- as.data.frame(raw@fix)
head(map)

# Get pheno
library(readxl)
pheno <- read_xlsx('Phenotype_dataset_Coenagrion_scitulum.xlsx')
head(pheno)

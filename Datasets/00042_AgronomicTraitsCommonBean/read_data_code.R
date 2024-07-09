library(vcfR)

# Get geno
geno <- read.vcfR('VEF_Pvulgaris_genotypic_data.vcf.gz')
dim(geno)

# Get pheno
pheno <- read.csv('VEF_raw_phenotypic_data.csv')
head(pheno)
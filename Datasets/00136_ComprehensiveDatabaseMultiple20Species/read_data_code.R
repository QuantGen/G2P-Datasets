library(vcfR)

# Get geno
geno <- read.vcfR('chrN_SPECIES_impute.vcf.gz')
dim(geno)

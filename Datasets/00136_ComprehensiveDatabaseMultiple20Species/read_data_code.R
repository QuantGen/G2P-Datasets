library(vcfR)

# Get geno
# Replace SPECIES with the required species name
geno <- read.vcfR('chrN_SPECIES_impute.vcf.gz')
dim(geno)

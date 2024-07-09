library(vcfR)

# Get geno
geno <- read.vcfR('WRC_genomic_selection+selfing_SNPs.vcf.gz')
dim(geno)

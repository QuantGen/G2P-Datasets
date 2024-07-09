# Install Rsamtools package
# if (!require("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# BiocManager::install("Rsamtools")

library(vcfR)
library(Rsamtools)

# Get geno
geno <- read.vcfR('ALL-samples-Q30-snps-recal-beagle-polymorphic.vcf')
dim(geno)

# Get map
map <- scanBam('ALL-samples-recal03.bam')
head(map)
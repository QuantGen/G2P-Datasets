library(vcfR)
raw <- read.vcfR('all.mergedSNPs.vcf.gz')

# Get geno
geno <- as.matrix(vcfR2genind(raw))
dim(geno)

# Get map
map <- as.data.frame(raw@fix)
head(map)

library(vcfR)

# Read data
raw <- read.vcfR('Tbisetosa_filtered_SNPs.vcf')

# Get geno
geno <- as.matrix(vcfR2genind(raw))
dim(geno)

# Get map
map <- as.data.frame(raw@fix)
head(map)
library(vcfR)

# Read data
raw <- read.vcfR('GBS_96.vcf')

# Get geno
geno <- as.matrix(vcfR2genind(raw))
dim(geno)

# Get map
map <- as.data.frame(raw@fix)
head(map)
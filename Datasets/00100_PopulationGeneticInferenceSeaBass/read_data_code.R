library(vcfR)

# Read data
raw <- read.vcfR('S3 File.vcf')

# Get geno
geno <- as.matrix(vcfR2genind(raw))
dim(geno)

# Get map
map <- as.data.frame(raw@fix)
head(map)
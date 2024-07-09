library(vcfR)

# Read data
raw <- read.vcfR('2321SNP_26pop_98ind.vcf')

# Get geno
geno <- as.matrix(vcfR2genind(raw))
dim(geno)

# Get map
map <- as.data.frame(raw@fix)
head(map)
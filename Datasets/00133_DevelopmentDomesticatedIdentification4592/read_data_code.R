library(vcfR)
raw <- read.vcfR('A1_SievQTL4592_Filt.vcf')

# Get geno
geno <- as.matrix(vcfR2genind(raw))
dim(geno)

# Get map
map <- as.data.frame(raw@fix)
head(map)

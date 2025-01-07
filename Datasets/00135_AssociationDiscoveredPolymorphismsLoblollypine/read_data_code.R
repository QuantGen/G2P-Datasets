library(vcfR)
raw <- read.vcfR('loblolly_pine_exome_SNPs_2.8million.vcf.gz')

# Get geno
geno <- as.matrix(vcfR2genind(raw))
dim(geno)

# Get map
map <- as.data.frame(raw@fix)
head(map)

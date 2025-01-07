library(vcfR)
raw <- read.vcfR('Picq_EvolApp_SpongyMothBiosafe_datafiltered.vcf')

# Get geno
geno <- as.matrix(vcfR2genind(raw))
dim(geno)

# Get map
map <- as.data.frame(raw@fix)
head(map)

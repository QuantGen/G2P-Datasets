library(vcfR)

# Read data
raw <- read.vcfR('VanWyngaardenM_etal_SeascapeGen_SNPMap4b.vcf')

# Get geno
geno <- as.matrix(vcfR2genind(raw))
dim(geno)

# Get map
map <- as.data.frame(raw@fix)
head(map)
library(vcfR)

# Read data
raw <- read.vcfR('Modern_genomic_dataset_all.vcf')

# Get geno
geno <- as.matrix(vcfR2genind(raw))
dim(geno)

# Get map
map <- as.data.frame(raw@fix)
head(map)

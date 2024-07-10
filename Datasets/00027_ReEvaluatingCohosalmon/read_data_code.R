library(vcfR)

# Read data
raw <- read.vcfR('01-all_coho_inds_filtered_m6_p60_x0_S5_mac15_maxmiss95.recode.vcf')

# Get geno
geno <- as.matrix(vcfR2genind(raw))
dim(geno)

# Get map
map <- as.data.frame(raw@fix)
head(map)

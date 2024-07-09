# Read data
library(vcfR)
vcffile <- list.files(pattern = '.vcf')
phefile <- list.files(pattern = 'description.txt')

# Get geno
geno <- read.vcfR(vcffile)
dim(geno)

# Get pheno
pheno <- read.delim(phefile, sep = '	', header = T, skip = 1)
head(pheno)

library(vcfR)

# Get geno
geno <- read.vcfR('FLOMASwProgeny.vcf.gz')
dim(geno)

# Get pheno
pheno <- read.csv('POLLENS_Pheno.csv')
head(pheno)


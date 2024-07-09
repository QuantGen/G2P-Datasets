library(vcfR)

# Get geno
geno <- read.vcfR('batch_1.vcf.gz')
dim(geno)

# Get pheno
pheno <- fread('CNVs_normalized_read_depth.txt')
head(pheno)

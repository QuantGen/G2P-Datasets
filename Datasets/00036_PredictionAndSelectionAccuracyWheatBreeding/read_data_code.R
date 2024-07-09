library(data.table)

# Get geno
geno <- fread('wheatGBSv2_20150422.hmp.txt', header = TRUE)
dim(geno)

# Get pheno
pheno <- fread('EYT_Phenotypes_Wide.csv')
head(pheno)

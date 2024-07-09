library(data.table)

# Get geno
geno <- fread('pone.0232665.s004.genotype')
dim(geno)

# Get pheno
pheno <- fread('pone.0232665.s003.phenotype')
head(pheno)

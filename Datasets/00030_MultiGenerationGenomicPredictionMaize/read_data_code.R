library(data.table)

# Get geno
geno <- fread('Geno_data.csv',header=T)
dim(geno)

# Get pheno
pheno <- fread('Pheno_data.csv')
head(pheno)

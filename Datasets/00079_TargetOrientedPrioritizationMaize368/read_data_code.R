library(data.table)

# Get geno
geno <- fread('file1_368Lines_100k_SNPs_numeric_freq.txt')
dim(geno)

# Get pheno
pheno <- fread('file4_368Lines_20traits.txt')
head(pheno)

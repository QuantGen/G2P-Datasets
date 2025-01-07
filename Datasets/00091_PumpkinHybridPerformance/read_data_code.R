library(data.table)

# Get geno
geno <- rbind(fread('C_maxima_hybrid_additive_genotype.txt'), fread("C_maxima_parental_genotype.txt"))
dim(geno)

# Get pheno
pheno <- fread('C_maxima_hybrid_phenotype.txt')
head(pheno)

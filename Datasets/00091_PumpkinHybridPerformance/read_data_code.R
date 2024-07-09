library(data.table)

# Get geno
geno <- as.matrix(suppressWarnings(fread('C_maxima_hybrid_additive_genotype.txt')), rownames = 1)
dim(geno)

# Get pheno and pedigree
pheno <- fread('C_maxima_hybrid_phenotype.txt')
head(pheno)

# Get parental geno
pargeno <- as.matrix(suppressWarnings(fread('C_maxima_parental_genotype.txt')), rownames = 1)
dim(pargeno)

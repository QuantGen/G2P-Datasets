library(data.table)

# Get geno
geno <- fread('Genotype data.txt')
dim(geno)

# Get pheno
pheno <- fread('Phenotype data.txt')
head(pheno)

# Get ped
ped <- fread('A matrix.txt')
head(ped)

# Get map
map <- fread('Genetic map.txt')
head(map)
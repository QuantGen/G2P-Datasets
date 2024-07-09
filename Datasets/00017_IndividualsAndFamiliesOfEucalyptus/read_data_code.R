library(data.table)

# Get geno
geno <- fread('SNP_Data.txt')
dim(geno)

# Get pheno
pheno <- fread('Phenotypic_data.txt')
head(pheno)

# Get pedigree
ped <- fread('Pedigree_data.txt')
head(ped)
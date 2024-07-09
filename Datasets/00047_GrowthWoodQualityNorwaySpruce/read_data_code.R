library(data.table)
library(adegenet)

# Get geno
load("Imputated_Gdata.RData")
geno <- Gdata
dim(geno)

# Get pheno
pheno <- fread('Fullsib_data.txt')
head(pheno)

# Get ped
ped <- fread("Pedigree.txt")
head(ped)
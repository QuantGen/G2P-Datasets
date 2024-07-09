library(data.table)
library(adegenet)

# Get geno
load("Genotypic_data_RGA_PBarre_12112015.rda")
geno <- Mrestrictedtwice
dim(geno)

# Get pheno
pheno <- fread('Phenotypic_data_RGA_PBarre_12112015.txt')
head(pheno)
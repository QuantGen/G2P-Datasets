library(tidyverse)
library(data.table)

# Get geno
geno <- fread('File_S3.txt')
dim(geno)

# Get pedigree
ped <- fread('File_S2.txt')
head(ped)

# Get pheno
pheno <- fread('File_S1.txt')
head(pheno)

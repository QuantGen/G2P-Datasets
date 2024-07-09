library(data.table)
library(readxl)

# Get geno
geno <- fread('Supplemental_File_S3.txt')
dim(geno)

# Get pheno
pheno <- read_excel('Supplemental_File_S2.xlsx')
head(pheno)

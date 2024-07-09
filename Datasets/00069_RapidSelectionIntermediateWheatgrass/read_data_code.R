library(data.table)

#Get geno
geno <- fread('Cycle7_Database_for_GS.txt')
geno <- fread('Cycle7_Production_for_GS.txt')
dim(geno)

#Get pheno
pheno <- fread('Phenotypes_For_Analysis.csv')
head(pheno)

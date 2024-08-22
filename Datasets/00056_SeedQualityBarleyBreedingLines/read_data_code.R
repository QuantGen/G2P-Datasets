library(readxl)

# Get geno
geno <- read.csv2('S2Table.csv')
dim(geno)

# Get pheno
pheno <- read_excel('S1Table.xlsx')
head(pheno)

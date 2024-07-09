library(readxl)

# Get geno
geno <- read.csv('Eucalyptus_SNPdata.csv')
dim(geno)

# Get pheno
pheno <- read_excel('Eucalyptus_Phentypic_data.xlsx')
head(pheno)


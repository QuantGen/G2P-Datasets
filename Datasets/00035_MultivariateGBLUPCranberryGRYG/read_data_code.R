library(readxl)

# Get geno
file <- 'Table_1_Multivariate GBLUP Improves Accuracy of Genomic Selection for Yield and Fruit Weight in Biparental Populations of Vaccinium macrocarpon Ait.xlsx'
geno <- read_xlsx(file,sheet = 5)
dim(geno)

# Get pheno
pheno <- read_xlsx(file,sheet = 6)
head(pheno)

library(readxl)

# Get geno
file <- 'Table 1.xlsx'
geno <- read_xlsx(file,sheet = 1,skip = 2)
dim(geno)

# Get pheno
pheno <- read_xlsx(file,sheet = 2)
head(pheno)

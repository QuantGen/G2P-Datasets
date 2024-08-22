library(readxl)

# Get geno
file <- 'Table 1.xlsx'
geno <- read_xlsx(file,sheet = 5)
dim(geno)

# Get pheno
pheno <- read_xlsx(file,sheet = 6)
head(pheno)

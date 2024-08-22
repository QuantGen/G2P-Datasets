library(readxl)

# Get geno
file <- 'Table 1.xlsx'
geno <- read_xlsx(file,sheet = 3)
dim(geno)

# Get pheno
pheno <- read_xlsx(file,sheet = 4)
head(pheno)

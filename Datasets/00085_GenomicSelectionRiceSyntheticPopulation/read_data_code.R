library(readxl)

# Get geno
geno <- read_xlsx('SEPANG_SNP.xlsx')
dim(geno)


# Get pheno
pheno <- read_xlsx('SEPANG_Pheno.xlsx',skip = 1)
head(pheno)

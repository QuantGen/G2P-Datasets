# Read data
raw <- read.csv('routtu_bmc_genomics_2014.csv')

# Get geno
geno <- raw[,c(8:ncol(raw))]
dim(geno)

# Get pheno
pheno <- raw[,c(1:7)]
head(pheno)

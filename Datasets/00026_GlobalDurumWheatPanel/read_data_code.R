library(data.table)

# Get geno
geno <- fread('GDP_Illumina_90K_SNP_1025Geno_44536SNP.txt', skip = 1,header = TRUE)
dim(geno)

# Get pheno
pheno <- fread('GDP_list_passport_1028_accessions.txt',skip = 2,header = TRUE)
head(pheno)

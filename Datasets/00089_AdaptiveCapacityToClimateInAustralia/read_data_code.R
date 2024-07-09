library(data.table)

# Get geno
geno <- fread('Ahrens_MEC_corymbia.lfmm')
dim(geno)

# Get pheno
pheno <- fread('Ahrens_lfmm_env_file.env')
head(pheno)


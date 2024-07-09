# Get geno
geno <- read.csv('Msi_unimputed_SNP_genotypes_field_trial.csv')
dim(geno)


# Get pheno
pheno <- read.csv('170205combined_yield_components_all.csv')
head(pheno)

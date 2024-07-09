# Get geno
geno <- readRDS(file = 'MAC_matrix_with_header.rds')
dim(geno)

# Get map
map <- readRDS(file = 'ath_all_new_maf_ldpruned_map.rds')
head(map)

# Get pheno
load(file = 'Pheno_pla.Rdata')
pheno <- Pheno_pla
head(pheno)

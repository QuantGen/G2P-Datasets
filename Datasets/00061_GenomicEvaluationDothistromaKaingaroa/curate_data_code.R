# Reformat pheno
colnames(pheno) <- c('id', 'pheno')

# Remove NAs in pheno
pheno <- pheno[!is.na(pheno$pheno),]

# Match IDs
IDs <- intersect(geno[,1], pheno$id)

# Reformat geno
geno <- geno[match(IDs, geno[,1]), -1]
rownames(geno) <- IDs
geno <- geno + 1

# Match pheno
pheno <- pheno[match(IDs, pheno$id),]

# Match IDs
IDs <- intersect(pheno$id, geno[,1])

# Reformat geno
geno <- geno[match(IDs, geno[,1]), -1]
rownames(geno) <- IDs

# Reformat pheno
pheno <- cbind(id = IDs, pheno[match(IDs, pheno$id), 12:ncol(pheno)])
colnames(pheno)[-1] <- paste0('pheno', 1:3)

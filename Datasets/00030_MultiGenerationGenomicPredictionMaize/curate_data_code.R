# Match IDs
IDs <- intersect(geno[,1], pheno[,1])

# Reformat geno
geno <- geno[match(IDs, geno[,1]), -1]
rownames(geno) <- IDs
geno[geno %in% 1] <- geno[geno %in% 1] + 1

# Reformat pheno
pheno <- cbind(id = IDs, pheno[match(IDs, pheno[,1]), 3:8])
colnames(pheno)[-1] <- paste0('pheno', 1:6)

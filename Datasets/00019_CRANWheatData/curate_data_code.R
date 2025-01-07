# Reformat pheno
colnames(pheno) <- paste0('pheno', 1:ncol(pheno))
pheno <- cbind(id = rownames(pheno), pheno)
rownames(pheno) <- NULL

# Add IDs to geno
rownames(geno) <- pheno$id

geno[geno == 1] <- 2

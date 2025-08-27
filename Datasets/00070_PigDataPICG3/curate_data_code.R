# Match IDs
IDs <- intersect(geno[,1], pheno$ID)

# Reformat geno
geno <- geno[match(IDs, geno[,1]),-1]
rownames(geno) <- IDs

# Reformat pheno
pheno <- data.frame(id = IDs, pheno = as.numeric(pheno$t1[match(IDs, pheno$ID)]))

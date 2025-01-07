# Reformat IDs in geno
rownames(geno) <- sapply(strsplit(rownames(geno), '_'), function(x) x[2])

# Match IDs
IDs <- intersect(pheno[,2], rownames(geno))
geno <- geno[IDs,]

# Reformat pheno
pheno <- data.frame(id = IDs, pheno = pheno$Phenotype[match(IDs, pheno[,2])])
